import 'package:aprova/models/exam_type.dart';
import 'package:aprova/widgets/buttons/menubutton.dart';
import 'package:flutter/material.dart';

class ExamTypeCard extends StatelessWidget {
  final Function() press;
  final ExamType examType;
  final int itemIndex;

  const ExamTypeCard(
      {Key? key,
      required this.press,
      required this.examType,
      required this.itemIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuButton(
          icon: Icon(
            Icons.archive,
            color: Theme.of(context).primaryColor,
          ),
          leanding: "Exame",
          text: examType.name.toString().toUpperCase(),
          press: press,
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 5.0))
      ],
    );
  }
}
