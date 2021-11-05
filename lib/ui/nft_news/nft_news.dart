import 'package:flutter/material.dart';

class NFTTrends extends StatefulWidget {
  const NFTTrends({Key? key}) : super(key: key);

  @override
  _NFTTrendsState createState() => _NFTTrendsState();
}

class _NFTTrendsState extends State<NFTTrends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Hi this is where you can read all the information regarding NFT trades!'
        ),
      ),
    );
  }
}
