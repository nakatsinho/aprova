import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {Key? key, this.text, this.press, this.color, this.backColor})
      : super(key: key);
  final Color? color;
  final Color? backColor;
  final String? text;
  final Function()?
      press; // It possible to use VoidCallBack? instead of Function

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56.0,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35))),
            backgroundColor: MaterialStateProperty.all(backColor)),
        onPressed: press,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: 18,
            color: color,
          ),
        ),
      ),
    );
  }
}
