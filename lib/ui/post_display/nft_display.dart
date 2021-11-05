import 'package:flutter/material.dart';

class NftDisplay extends StatefulWidget {
  const NftDisplay({Key? key}) : super(key: key);

  @override
  _NftDisplayState createState() => _NftDisplayState();
}

class _NftDisplayState extends State<NftDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Here you can see the NFTs!'
        ),
      ),
    );
  }
}
