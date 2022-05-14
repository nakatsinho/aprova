import 'dart:async';
import 'dart:convert';

import 'package:aprova/views/auth/register.dart';
import 'package:aprova/views/root/menu.dart';
import 'package:aprova/widgets/buttons/defaultbutton.dart';
import 'package:aprova/widgets/snack/default_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static String routeNamed = "/Login";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Porfavor, introduza tua senha'),
    MinLengthValidator(8, errorText: 'Senha deve conter min. 8 caracteres'),
    // PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character'),
  ]);

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void initState() {}

  void loginPop(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w200,
          fontSize: 18.0,
          color: Colors.white54,
        ),
      ),
      backgroundColor: Theme.of(context).primaryColorDark,
      duration: Duration(seconds: 5),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void localTempSave(Map<String, dynamic> json) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("user", jsonEncode(json));

    saveUserCredentials(nameController.text, passwordController.text);

    // give time to user change take effect
    await Future.delayed(Duration(seconds: 2));

    // loginPop();
    Navigator.of(context).pushNamed(MenuScreen.routeNamed);
  }

  void retriveUser() async {
    setState(() {
      isLoading = true;
    });
    try {
      http.Response loginResponse = await http
          .post(Uri.parse("https://4cc5-197-249-5-84.ngrok.io/api/fetch/user"),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, dynamic>{
                'name': nameController.text,
                'surname': passwordController.text,
              }))
          .timeout(Duration(seconds: 10));
      print(loginResponse.statusCode);
      if (loginResponse.statusCode >= 200 || loginResponse.statusCode <= 299) {
        Map<String, dynamic> json = jsonDecode(loginResponse.body);
        //COMPARAÇÕES
        //nao tem utilizador
        if (json['key'].toString() == 'non') {
          loginPop(json['message'].toString());
          setState(() {
            isLoading = false;
          });
          return;
        }
        //utilizador encontrado mas pode ou nao ter lista de resumo de consumo
        if (json['key'].toString() == 'admin' ||
            json['key'].toString() == 'exper') {
          try {
            loginPop(json['message'].toString());
            localTempSave(json);
          } on Exception catch (e) {
            print('failed 1');
            DefaultSnackBar().defaultSnackBar(context, e.toString());
            setState(() {
              isLoading = false;
            });
            print(e);
            return;
          }
        }
      } else {
        print('failed 2');
        setState(() {
          isLoading = false;
        });
      }
    } on TimeoutException catch (e) {
      print('timeout! timeout! $e');
      setState(() {
        isLoading = false;
        DefaultSnackBar().defaultSnackBar(context, 'Tempo Esgotado');
      });
    } on Exception catch (e) {
      print('failed 1');
      setState(() {
        isLoading = false;
      });
      print(e);
      DefaultSnackBar().defaultSnackBar(context, 'Server Connection Error...');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("assets/background.jpg", fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/logo.png",
                            width: 250,
                          ),
                          Text(
                            "Bem vindo!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 45.0),
                          ),
                          Form(
                            key: _formKey,
                            child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      controller: nameController,
                                      style: TextStyle(color: Colors.white),
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                          labelText:
                                              "Nome do Usuario".padLeft(20),
                                          labelStyle: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Lato-Light",
                                              letterSpacing: 1.5),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white))),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Porfavor introduza texto nesse campo.";
                                        }
                                        return null;
                                      },
                                    ),
                                    Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10)),
                                    TextFormField(
                                      controller: passwordController,
                                      obscureText: true,
                                      style: TextStyle(color: Colors.white),
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        labelText: "Senha".padLeft(10),
                                        labelStyle: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Lato-Light",
                                            letterSpacing: 1.5),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                      ),
                                      validator: passwordValidator,
                                    ),
                                    Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 20)),
                                    DefaultButton(
                                      text: "Iniciar SESSÃO".toUpperCase(),
                                      press: () {
                                        if (_formKey.currentState!.validate()) {
                                          //Executa esse campo se campos forem validos!
                                          retriveUser();
                                        }
                                      },
                                    ),
                                  ],
                                )),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context)
                                .pushNamed(Register.routeNamed),
                            child: Text(
                              "Nao tem conta ?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void saveUserCredentials(String name, String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("name", name);
    prefs.setString("password", password);
  }
}
