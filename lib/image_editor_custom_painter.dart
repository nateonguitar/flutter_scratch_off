import 'dart:math' as Math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ImageEditorCustomPainter extends CustomPainter {
  final ui.Image background;
  final ui.Image toApply;

  ImageEditorCustomPainter({
    required this.background,
    required this.toApply,
  });

  @override
  void paint(Canvas canvas, Size size) async {

    // The circle should be paint before or it will be hidden by the path
    // Paint paintCircle = Paint()..color = Colors.black;
    // Paint paintBorder = Paint()
    //   ..color = Colors.white
    //   ..strokeWidth = size.width / 36
    //   ..style = PaintingStyle.stroke;
    // canvas.drawCircle(center, radius, paintCircle);
    // canvas.drawCircle(center, radius, paintBorder);

    // draw background of canvas
    // canvas.drawRect(
    //   Rect.fromLTWH(0, 0, size.width, size.height),
    //   Paint()..color = Colors.green,
    // );

    Path path = Path()
      ..addOval(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.clipPath(path);

    // canvas.drawImageRect(background, Rect.fromLTWH(0, 0, , height), dst, paint)
    canvas.drawImage(toApply, Offset(0, 0), Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
