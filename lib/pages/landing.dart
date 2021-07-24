import 'package:flutter/material.dart';
import 'package:image_mask_test/widgets/partial_replace_canvas.dart';

class LandingPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LandingPage> {
  final String _backgroundAsset = 'assets/1.png';
  final String _toApplyAsset = 'assets/2.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return Center(
      child: ListView(
        children: [
          Row(
            children: [
              Container(
                child: PartialReplaceCanvas(
                  backgroundColor: Colors.grey,
                  backgroundAsset: _backgroundAsset,
                  toApplyAsset: _toApplyAsset,
                  size: const Size.square(500),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
