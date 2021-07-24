import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as UI;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:image_mask_test/image_editor_custom_painter.dart';

class PartialReplaceCanvas extends StatefulWidget {
  final Color backgroundColor;
  final String backgroundAsset;
  final String toApplyAsset;
  final Size size;
  PartialReplaceCanvas({
    required this.backgroundColor,
    required this.backgroundAsset,
    required this.toApplyAsset,
    required this.size,
  });
  @override
  _PartialReplaceCanvasState createState() => _PartialReplaceCanvasState();
}

class _PartialReplaceCanvasState extends State<PartialReplaceCanvas> {
  bool _initialized = false;
  late UI.Image _background;
  late UI.Image _toApply;
  late Rect _backgroundSize;
  late Rect _toApplySize;

  @override
  void initState() {
    _initAsync();
    super.initState();
  }

  Future<void> _initAsync() async {
    _background = await loadImage(widget.backgroundAsset);
    _toApply = await loadImage(widget.toApplyAsset);
    _backgroundSize = Rect.fromLTWH(0, 0, _background.width.toDouble(), _background.height.toDouble());
    _toApplySize = Rect.fromLTWH(0, 0, _toApply.width.toDouble(), _toApply.height.toDouble());
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
    return Container(
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
            ),
          ),
        ],
      ),
    );
  }
}
