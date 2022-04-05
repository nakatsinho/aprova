import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String? answerText;
  final Color? answerColor;
  final Function? answerTap;

  Answer({this.answerText, this.answerColor, this.answerTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => answerTap,
      child: Container(
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          answerText ?? '',
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}
