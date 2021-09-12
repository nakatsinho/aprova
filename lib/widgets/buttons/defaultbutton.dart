import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function()? press; // It possible to use VoidCallBack? instead of Function

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56.0,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
            backgroundColor: MaterialStateProperty.all(Theme.of(context).accentColor)),
        onPressed: press,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}