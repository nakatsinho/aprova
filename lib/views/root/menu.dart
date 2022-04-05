import 'package:aprova/views/root/subject.dart';
import 'package:aprova/widgets/buttons/menubutton.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);
  static String routeNamed = "/Menu";

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Icon(Icons.more_horiz_rounded),
      //   actions: [
      //     CircleAvatar(
      //       backgroundColor: Colors.white,
      //       child: IconButton(
      //           onPressed: () {},
      //           icon: Icon(
      //             Icons.person,
      //             color: Theme.of(context).primaryColor,
      //           )),
      //     ),
      //   ],
      // ),
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
                          Container(
                            height: 50.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.more_horiz_rounded,
                                  color: Colors.white,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.person,
                                        color: Theme.of(context).primaryColor,
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                          Text(
                            "Tipo de Exame",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 34.0,
                              letterSpacing: 2.5,
                            ),
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 25)),
                          MenuButton(
                            icon: Icon(
                              Icons.archive,
                              color: Theme.of(context).primaryColor,
                            ),
                            leanding: "Exame",
                            text: "Admissão".toUpperCase(),
                            press: () {
                              print("Cartao selecionado!");
                            },
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                          MenuButton(
                            icon: Icon(
                              Icons.archive,
                              color: Theme.of(context).primaryColor,
                            ),
                            leanding: "Exame",
                            text: "Extraordinário".toUpperCase(),
                            press: () {
                              Navigator.of(context)
                                  .pushNamed(Subject.routeNamed);
                            },
                          ),
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
