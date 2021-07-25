import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as UI;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_scratch_off/image_editor_custom_painter.dart';

class ScratchOff extends StatefulWidget {
  final Color backgroundColor;
  final String backgroundAsset;
  final String toApplyAsset;
  final Size size;
  ScratchOff({
    required this.backgroundColor,
    required this.backgroundAsset,
    required this.toApplyAsset,
    required this.size,
  });
  @override
  _ScratchOffState createState() => _ScratchOffState();
}

class _ScratchOffState extends State<ScratchOff> {
  bool _initialized = false;
  late UI.Image _background;
  late UI.Image _toApply;
  List<Offset> _touchPoints = [];

  @override
  void initState() {
    _initAsync();
    super.initState();
  }

  Future<void> _initAsync() async {
    _background = await loadImage(widget.backgroundAsset);
    _toApply = await loadImage(widget.toApplyAsset);
    _initialized = true;
    setState(() {});
  }

  Future<UI.Image> loadImage(String assetPath) async {
    ByteData image1bytes = await rootBundle.load(assetPath);
    Uint8List img = Uint8List.view(image1bytes.buffer);
    final Completer<UI.Image> completer = new Completer();
    UI.decodeImageFromList(img, (UI.Image img) {
      return completer.complete(img);
    });
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return GestureDetector(
      onTapDown: (details) {
        _addTouchPoint(details.localPosition);
      },
      onPanUpdate: (details) {
        _addTouchPoint(details.localPosition);
      },
      child: Container(
        color: widget.backgroundColor,
        child: Stack(
          children: [
            SizedBox(
              width: widget.size.width,
              height: widget.size.height,
              child: Image.asset(widget.backgroundAsset),
            ),
            CustomPaint(
              size: widget.size,
              painter: ImageEditorCustomPainter(
                background: _background,
                toApply: _toApply,
                touchPoints: _touchPoints,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addTouchPoint(Offset offset) {
    bool exists = false;
    for (Offset point in _touchPoints) {
      if (point == offset) {
        exists = true;
      }
    }
    if (!exists) {
      _touchPoints.add(offset);
      setState(() {});
    }
  }
}
