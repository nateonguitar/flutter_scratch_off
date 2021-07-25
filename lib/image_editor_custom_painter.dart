import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ImageEditorCustomPainter extends CustomPainter {
  final ui.Image scratcherLayer;
  final List<Offset> touchPoints;

  ImageEditorCustomPainter({
    required this.scratcherLayer,
    required this.touchPoints,
  });

  @override
  void paint(Canvas canvas, Size size) async {
    canvas.saveLayer(Rect.largest, Paint());
    canvas.drawImageRect(
      scratcherLayer,
      Rect.fromLTWH(0, 0, scratcherLayer.width.toDouble(), scratcherLayer.height.toDouble()),
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
