import 'package:aprova/views/root/header.dart';
import 'package:aprova/views/root/navigation.dart';
import 'package:aprova/views/root/subject_list.dart';
import 'package:aprova/widgets/buttons/defaultbutton.dart';
import 'package:flutter/material.dart';

class Subject extends StatefulWidget {
  const Subject({Key? key, this.examType}) : super(key: key);
  static String routeNamed = "/Subject";
  final String? examType;

  @override
  _SubjectState createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  String subjectValues = "Secção";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerMain(),
      body: Builder(
        builder: (context) {
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset("assets/half_background.jpg", fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            child: Column(
                              children: [
                                HeaderMenu(),
                                Center(
                                  child: Text(
                                    widget.examType!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 34.0,
                                      letterSpacing: 2.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            height: 300.0,
                            child: Column(
                              children: <Widget>[
                                DropdownButtonFormField<String>(
                                  value: subjectValues,
                                  dropdownColor:
                                      Theme.of(context).colorScheme.secondary,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      subjectValues = newValue!;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor),
                                    ),
                                    filled: true,
                                    fillColor: Colors.transparent,
                                  ),
                                  icon: Icon(
                                    Icons.arrow_drop_down_outlined,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  items: <String>[
                                    'Secção',
                                    'Letras',
                                    'Ciencias'
                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                            color: Theme.of(context).primaryColor,
                                            fontFamily: "Lato-Light",
                                            letterSpacing: 1.5),
                                      ),
                                    );
                                  }).toList(),
                                ),
                                Padding(
                                    padding: EdgeInsets.symmetric(vertical: 40.0)),
                                DefaultButton(
                                  text: "Contrinuar",
                                  press: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SubjectList(
                                                  subject: widget.examType!,
                                                )));
                                  },
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
