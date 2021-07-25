import 'package:flutter/material.dart';
import 'package:flutter_scratch_off/widgets/scratch_off.dart';

class LandingPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LandingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scratcher Test'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  child: ScratchOff(
                    child: Image.asset('assets/1.png'),
                    backgroundColor: Colors.red,
                    scratcherLayerAsset: 'assets/2.png',
                    size: Size(300, 250),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  child: ScratchOff(
                    child: const Center(child: Text('Test')),
                    backgroundColor: Colors.yellow,
                    scratcherLayerAsset: 'assets/1.png',
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
