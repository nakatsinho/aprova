import 'package:aprova/widgets/buttons/defaultbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  static String routeNamed = "/Register";

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final nameController = TextEditingController();
  String citiesValues = "Maputo";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: <Widget>[
      Image.asset("assets/background.jpg", fit: BoxFit.cover),
      Padding(
          padding: const EdgeInsets.all(20.0),
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  "Criar Conta".toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Lato-Black",
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 2,
                  color: Colors.white,
                  width: 135.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 25, top: 30.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              labelText: "Nome*".padLeft(7),
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lato-Light",
                                  letterSpacing: 1.5),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Porfavor introduza texto nesse campo.";
                            }
                            return null;
                          },
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                        TextFormField(
                          controller: nameController,
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              labelText: "Apelido*".padLeft(10),
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lato-Light",
                                  letterSpacing: 1.5),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Porfavor introduza texto nesse campo.";
                            }
                            return null;
                          },
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                        TextFormField(
                          controller: nameController,
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              labelText: "Bilhete de Identidade*".padLeft(24),
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lato-Light",
                                  letterSpacing: 1.5),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Porfavor introduza texto nesse campo.";
                            }
                            return null;
                          },
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                        DropdownButtonFormField<String>(
                          value: citiesValues,
                          onChanged: (String? newValue) {
                            setState(() {
                              citiesValues = newValue!;
                            });
                          },
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            filled: true,
                            hintText: "Introduza a Provincia",
                            fillColor: Colors.transparent,
                          ),
                          icon: Icon(
                            Icons.arrow_drop_down_circle_outlined,
                            color: Colors.white,
                          ),
                          items: <String>['Maputo', 'Gaza', 'Inhambane']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Lato-Light",
                                    letterSpacing: 1.5),
                              ),
                            );
                          }).toList(),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                        TextFormField(
                          controller: nameController,
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              labelText: "Telefone*".padLeft(11),
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lato-Light",
                                  letterSpacing: 1.5),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Porfavor introduza texto nesse campo.";
                            }
                            return null;
                          },
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                        Text(
                          "Registar dados de acesso".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontFamily: "Lato-Light"),
                        ),
                        TextFormField(
                          controller: nameController,
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              labelText: "Email*".padLeft(8),
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lato-Light",
                                  letterSpacing: 1.5),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Porfavor introduza texto nesse campo.";
                            }
                            return null;
                          },
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                        TextFormField(
                          controller: nameController,
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              labelText: "Senha".padLeft(8),
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lato-Light",
                                  letterSpacing: 1.5),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Porfavor introduza texto nesse campo.";
                            }
                            return null;
                          },
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                        TextFormField(
                          controller: nameController,
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              labelText: "Repetir Senha".padLeft(16),
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lato-Light",
                                  letterSpacing: 1.5),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Porfavor introduza texto nesse campo.";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 55.0, vertical: 30.0),
                  child: DefaultButton(
                      text: "Cadastrar-me".toUpperCase(),
                      press: () {
                        if (_formKey.currentState!.validate()) {
                          // Executa o comando de cadastro!
                        }
                      }),
                )
              ],
            ),
          )))
    ]));
  }
}
