import 'package:aprova/routes/app.dart';
import 'package:aprova/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aprova',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: HexColor("#0859C8"),
        accentColor: Color(0xFFFEF9EB)
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: Login.routeNamed,
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
