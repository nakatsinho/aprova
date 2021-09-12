import 'package:aprova/views/auth/login.dart';
import 'package:aprova/views/auth/register.dart';
import 'package:flutter/widgets.dart';
final Map <String,WidgetBuilder> routes = {
  Login.routeNamed : (context) => new Login(),
  Register.routeNamed : (context) => new Register(),
};