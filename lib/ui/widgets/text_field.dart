import 'package:flutter/material.dart';
import 'package:freelance/settings/config.dart';

class AuthTextField extends StatefulWidget {
  String type;
  String? error;
  final bool Function(String?)? valid;
  final bool Function(String?, int?)? validPassword;
  IconData? icon;
  String hintText;

  AuthTextField(
      {Key? key,
      this.type = 'text',
      this.error,
      this.icon,
      this.hintText = "exemple",
      this.valid,
      this.validPassword})
      : super(key: key);

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  List<BoxShadow>? boxShadows = [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 2,
      offset: const Offset(1, 3),
    )
  ];
  bool _error = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * .9,
      margin: EdgeInsets.only(top: context.height * .04),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular( 30),
          boxShadow: !_error ? boxShadows : null),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: widget.type == "number" ? TextInputType.number : TextInputType.text,
        obscureText: widget.type == "password",
        expands: false,
        style: const TextStyle(fontSize: 16.0, color: Colors.black54),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15.0),
            prefixIcon: widget.icon != null ? Icon(
              widget.icon,
              color: Colors.black54,
            ) : null ,
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.black54),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple.shade400),
              borderRadius: BorderRadius.circular( 30.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular( 30.0),
              borderSide: BorderSide(color: Colors.red.shade300),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular( 30.0),
              borderSide: BorderSide(color: Colors.red.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade100),
              borderRadius: BorderRadius.circular( 30.0),
            ),
            fillColor: Colors.grey.shade100,
            filled: true),
        validator: (value) {
          if (widget.type == "password" &&
              widget.validPassword != null &&
              !widget.validPassword!.call(value, 6)) {
            Future.delayed(Duration.zero, () {
              setState(() {
                _error = true;
              });
            });
            return widget.error;
          } else if (widget.valid != null && !widget.valid!.call(value)) {
            Future.delayed(Duration.zero, () {
              setState(() {
                _error = true;
              });
            });
            return widget.error;
          }
          Future.delayed(Duration.zero, () {
            setState(() {
              _error = false;
            });
          });
          return null;
        },
      ),
    );
  }
}
