import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    path.lineTo(0, size.height * .7);
    path.quadraticBezierTo(size.width * 0.05, size.height * 0.93,
        size.width * 0.1, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.2, size.height * .9,
        size.width * 0.25, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.37, size.height * 0.52,
        size.width * 0.50, size.height * 0.70);
    path.quadraticBezierTo(size.width * 0.60, size.height * 0.85,
        size.width * 0.65, size.height * 0.65);
    path.quadraticBezierTo(
        size.width * 0.70, size.height * 0.90, size.width, 0);

    path.close();
    paint.shader = ui.Gradient.linear(
      const Offset(0, 0),
      Offset(size.width * 0.5, size.height),
      [
        Colors.purple.shade600,
        Colors.purple.shade200,
      ],
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
