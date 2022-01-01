import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String tokenId;

  DetailsPage(this.tokenId);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This page will display all the NFT Details!!!!',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
