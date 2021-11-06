import 'package:flutter/material.dart';
import 'package:boilerplate/constants/assets.dart';

class NFTTrends extends StatefulWidget {
  const NFTTrends({Key? key}) : super(key: key);

  @override
  _NFTTrendsState createState() => _NFTTrendsState();
}

class _NFTTrendsState extends State<NFTTrends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _customNftPost(Assets.nftPicture1, 'Random Mess', '98'),
          _customNftPost(Assets.nftPicture1, 'Random Mess', '98'),
          _customNftPost(Assets.nftPicture1, 'Random Mess', '98'),
          _customNftPost(Assets.nftPicture1, 'Random Mess', '98'),
        ],
      )
    );
  }

  Widget _customNftPost(String imageAddress , String nftName , String popularityPercentage){
    return   Container(
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withAlpha(100), blurRadius: 10.0),
            ]),
        child: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[


            ],
          ),
        ));

  }

}
