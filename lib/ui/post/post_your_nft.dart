import 'package:flutter/material.dart';

class PostYourNft extends StatefulWidget {
  const PostYourNft({Key? key}) : super(key: key);

  @override
  _PostYourNftState createState() => _PostYourNftState();
}

class _PostYourNftState extends State<PostYourNft> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Hi this is where you can Post your NFTs!'
        ),
      ),
    );
  }
}
