import 'package:aprova/models/exam_type.dart';
import 'package:aprova/utils/api.dart';
import 'package:aprova/utils/const.dart';
import 'package:aprova/views/exams/exam_card.dart';
import 'package:aprova/views/root/header.dart';
import 'package:aprova/views/root/navigation.dart';
import 'package:aprova/views/root/subject.dart';
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
      drawer: NavigationDrawerMain(),
      body: Builder(
        builder: (context) {
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset("assets/background.jpg", fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            height: 200.0,
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  HeaderMenu(),
                                  Padding(
                                      padding: EdgeInsets.symmetric(vertical: 20)),
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
                                  Padding(
                                      padding: EdgeInsets.symmetric(vertical: 10)),
                                ],
                              ),
                            ),
                          )),
                      Expanded(
                        flex: 2,
                        child: Container(
                            color: Colors.transparent,
                            child: FutureBuilder<List<ExamType>>(
                              future: MakeRequest.getAllCountriesModel(context),
                              builder: (context, snapshot) {
                                final fetchExamsType = snapshot.data;
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return queryExamsTypeList(fetchExamsType!);
                                } else if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: ACCENT,
                                    ),
                                  );
                                }
                                return Container();
                              },
                            )),
                      ),
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

  Widget queryExamsTypeList(List<ExamType> fetchExamsTypes) => ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: fetchExamsTypes.length,
      itemBuilder: (context, index) => ExamTypeCard(
          itemIndex: index,
          examType: fetchExamsTypes[index],
          press: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Subject(
                    examType: fetchExamsTypes[index].name,
                  ),
                ));
            print(fetchExamsTypes[index].name);
          }));
}
