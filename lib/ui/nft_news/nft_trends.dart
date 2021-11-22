import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/models/nft/nft_details.dart';
import 'package:boilerplate/ui/post_display/nft_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 15),
          child: _customText('Trending at NFTPur'),
        ),
        SizedBox(
          height: 30,
        ),
        _customNftPost(Assets.nftTrending1, 'Mind Universe', '98', '250'),
        _customNftPost(Assets.nftTrending2, 'Cat Nip', '89', '430'),
        _customNftPost(Assets.nftTrending3, 'Nigerian Machine', '93', '110'),
        _customNftPost(Assets.nftTrending4, 'Sailor Monkey', '76', '20'),
      ],
    ));
  }

  Widget _customNftPost(String imageAddress, String nftName,
      String popularityPercentage, String price) {
    return InkWell(
      onTap: () {
        NftDetails _nftDetails = NftDetails(
            nftName: nftName,
            imageAddress: imageAddress,
            nftDescription: 'Hi this is a random text about the above NFT!',
            nftPrice: price);

        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => NftDisplay(_nftDetails  ,true)));
      },
      child: Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(nftName,
                        style: GoogleFonts.italiana(
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900),
                        )),
                    Text(popularityPercentage,
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              fontSize: 17, color: Colors.green),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$$price",
                      style: const TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Image.asset(
                  "$imageAddress",
                  height: double.infinity,
                )
              ],
            ),
          )),
    );
  }

  Widget _customText(String text) {
    return Text('$text',
        style: GoogleFonts.italiana(
          textStyle: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
        ));
  }
}
