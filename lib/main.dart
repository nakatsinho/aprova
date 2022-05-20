import 'package:aprova/routes/app.dart';
import 'package:aprova/utils/const.dart';
import 'package:aprova/views/auth/login.dart';
import 'package:flutter/material.dart';

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
          fontFamily: 'Lato',
          primaryColor: BLUE,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
              .copyWith(secondary: ACCENT)),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: Login.routeNamed,
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
