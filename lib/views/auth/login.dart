import 'package:aprova/views/auth/register.dart';
import 'package:aprova/widgets/buttons/defaultbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';

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

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Porfavor, introduza tua senha'),
    MinLengthValidator(8, errorText: 'Senha deve conter min. 8 caracteres'),
    // PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character'),
  ]);

  void dispose() {}

  void initState() {}

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
                                      text: "Iniciar Sessao".toUpperCase(),
                                      press: () {
                                        if (_formKey.currentState!.validate()) {
                                          //Executa esse campo se campos forem validos!
                                          print("Passou com sucesso!");
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
}
