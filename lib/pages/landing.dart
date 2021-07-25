import 'package:flutter/material.dart';
import 'package:flutter_scratch_off/widgets/scratch_off.dart';

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
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draw to erase!'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  child: ScratchOff(
                    backgroundColor: Colors.blue,
                    backgroundAsset: _backgroundAsset,
                    toApplyAsset: _toApplyAsset,
                    size: Size(300, 250),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
