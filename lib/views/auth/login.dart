import 'package:aprova/widgets/buttons/defaultbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static String routeNamed = "/Login";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  void dispose() {}

  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("assets/background.jpg", fit: BoxFit.fill),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      children: <Widget>[
                        Image.asset("assets/logo.png"),
                        Text(
                          "Bem vindo!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 45.0),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                        Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                TextFormField(
                                  controller: nameController,
                                  style: TextStyle(color: Colors.white),
                                  cursorColor: Colors.white,
                                  decoration: InputDecoration(
                                    labelText: "Nome do Usuario".padLeft(20),
                                    border: UnderlineInputBorder(),
                                  ),
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  style: TextStyle(color: Colors.white),
                                  cursorColor: Colors.white,
                                  decoration: InputDecoration(
                                      labelText: "Senha".padLeft(10),
                                      border: UnderlineInputBorder()),
                                ),
                                DefaultButton(
                                  text: "Iniciar Sessao".toUpperCase(),
                                  press: () {},
                                ),
                                Text(
                                  "Nao tem conta?",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
