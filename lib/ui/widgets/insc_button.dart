import 'package:flutter/material.dart';

class InscriptionButton extends StatelessWidget {
  void Function() onPressed;
  String content;

  InscriptionButton({Key? key, required this.onPressed, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: RaisedButton(
        onPressed: onPressed,
        textColor: Colors.white,
        padding: const EdgeInsets.all(0),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.purple.shade400,
                  Colors.purple.shade300,
                  Colors.purple.shade200,
                ],
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
          child: Text(content, style: const TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
