import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ImageEditorCustomPainter extends CustomPainter {
  final ui.Image background;
  final ui.Image toApply;
  final List<Offset> touchPoints;

  ImageEditorCustomPainter({
    required this.background,
    required this.toApply,
    required this.touchPoints,
  });

  @override
  void paint(Canvas canvas, Size size) async {
    canvas.saveLayer(Rect.largest, Paint());
    canvas.drawImageRect(
      toApply,
      Rect.fromLTWH(0, 0, toApply.width.toDouble(), toApply.height.toDouble()),
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint(),
    );
    for (Offset point in touchPoints) {
      canvas.drawCircle(point, 20, Paint()..blendMode = BlendMode.clear);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
