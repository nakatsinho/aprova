import 'package:aprova/views/root/subject_list.dart';
import 'package:aprova/widgets/buttons/defaultbutton.dart';
import 'package:flutter/material.dart';

class Subject extends StatefulWidget {
  const Subject({Key? key}) : super(key: key);
  static String routeNamed = "/Subject";

  @override
  _SubjectState createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  String subjectValues = "Secção";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("assets/half_background.jpg", fit: BoxFit.cover),
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
                                  Icons.keyboard_arrow_left,
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
                          Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                          Text(
                            "Extraordinário",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 34.0,
                              letterSpacing: 2.5,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 40.0)),
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
                            items: <String>['Secção', 'Gaza', 'Inhambane']
                                .map<DropdownMenuItem<String>>((String value) {
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
                              padding: EdgeInsets.symmetric(vertical: 10.0)),
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
                            items: <String>['Secção', 'Gaza', 'Inhambane']
                                .map<DropdownMenuItem<String>>((String value) {
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
                              Navigator.of(context)
                                  .pushNamed(SubjectList.routeNamed);
                            },
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
