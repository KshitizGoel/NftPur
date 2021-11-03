import 'package:flutter/material.dart';

class NFTDisplayScreen extends StatefulWidget {
  const NFTDisplayScreen({Key? key}) : super(key: key);

  @override
  _NFTDisplayScreenState createState() => _NFTDisplayScreenState();
}

class _NFTDisplayScreenState extends State<NFTDisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hi here you can view your NFT!'),
      ),
    );
  }
}
