import 'package:aprova/views/auth/login.dart';
import 'package:aprova/views/auth/register.dart';
import 'package:aprova/views/root/menu.dart';
import 'package:aprova/views/root/subject.dart';
import 'package:aprova/views/root/subject_list.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  Login.routeNamed: (context) => new Login(),
  Register.routeNamed: (context) => new Register(),
  MenuScreen.routeNamed: (context) => new MenuScreen(),
  SubjectList.routeNamed: (context) => new SubjectList(),
};
