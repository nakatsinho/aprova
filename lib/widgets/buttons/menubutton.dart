import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String? text;
  final String? leanding;
  final Icon? icon;
  final Function()? press;
  const MenuButton({Key? key, this.press, this.text, this.leanding, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75.0,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17))),
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).accentColor)),
          onPressed: press,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              icon!,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    leanding!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    text!,
                    style: TextStyle(
                        fontSize: 22,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
