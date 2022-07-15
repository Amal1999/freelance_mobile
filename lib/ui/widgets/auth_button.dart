import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  void Function() onPressed;
  String content;

  AuthButton({Key? key, required this.onPressed, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 35),
      child: RaisedButton(
        onPressed: onPressed,
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.purple.shade400,
                  Colors.purple.shade300,
                  Colors.purple.shade200,
                ],
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20.0))),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Text(content, style: const TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
