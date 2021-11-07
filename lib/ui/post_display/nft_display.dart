import 'package:another_flushbar/flushbar_helper.dart';
import 'package:boilerplate/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'full_size_display.dart';

class NftDisplay extends StatefulWidget {
  final String imageAddress, nftName, description , price;

  NftDisplay(this.imageAddress, this.nftName, this.description , this.price);

  @override
  _NftDisplayState createState() =>
      _NftDisplayState(imageAddress, nftName, description , price);
}

class _NftDisplayState extends State<NftDisplay> {
  final String imageAddress, nftName, description , price;

  _NftDisplayState(this.imageAddress, this.nftName, this.description, this.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade700.withOpacity(0.60),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: InkWell(
          onTap: () {
            FlushbarHelper.createInformation(
              message: 'Hi, We will proceed to complete your request!',
              title: 'Success',
              duration: Duration(seconds: 3),
            )
              ..show(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0, left: 40),
            child: Container(
              width: 170,
              decoration: BoxDecoration(
                  color: Colors.yellow.shade700,
                  borderRadius: BorderRadius.circular(40)
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Icon(Icons.local_offer_outlined),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'BUY THIS NFT', style: TextStyle(fontWeight: FontWeight
                          .bold),),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          _displayNftImage(widget.imageAddress),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20),
                child: _customText('${widget.nftName}', 25),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 20),
                child: _customTextForPrice('\$$price', 25),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(left: 15, top: 20),
              child: Text('${widget.description}' + Strings.constantNFTDescription,
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                        fontSize: 17, color: Colors.black54),
                  )), )
        ],
      ),
    );
  }

  Widget _displayNftImage(String imageAddress) {
    return InkWell(
      onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context){
        return FullSizeDisplay(imageAddress);
      })),
      child: Container(
        height: 200,
        decoration: BoxDecoration(color: Colors.black),
        child: Image.asset(
          "$imageAddress",
          height: double.infinity,
        ),
      ),
    );
  }

  Widget _customText(String text, double fontSize) {
    return Text('$text',
        style: GoogleFonts.italiana(
          textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: fontSize),
        ));
  }

  Widget _customTextForPrice(String text, double fontSize) {
    return Text('$text',
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: fontSize),
        ));
  }
}
