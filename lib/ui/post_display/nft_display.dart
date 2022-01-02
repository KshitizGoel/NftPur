import 'package:another_flushbar/flushbar_helper.dart';
import 'package:boilerplate/constants/strings.dart';
import 'package:boilerplate/models/nft/nft_details.dart';
import 'package:boilerplate/ui/payments_page/payments_page.dart';
import 'package:boilerplate/widgets/custom_columns.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'details_page.dart';
import 'full_size_display.dart';

class NftDisplay extends StatefulWidget {
  final NftDetails _nftDetails;
  final bool isOwned;

  NftDisplay(this._nftDetails, this.isOwned);

  @override
  _NftDisplayState createState() => _NftDisplayState(_nftDetails);
}

class _NftDisplayState extends State<NftDisplay> {
  final NftDetails _nftDetails;

  _NftDisplayState(this._nftDetails);

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
      floatingActionButton: widget.isOwned
          ? _customFloatingActionButton('BUY THIS NFT')
          : _customFloatingActionButton('VIEW'),
      body: ListView(
        children: [
          _displayNftImage(widget._nftDetails.imageAddress),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20),
                child: _customText('${widget._nftDetails.nftName}', 25),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 20),
                child: _customTextForPrice('Ξ${_nftDetails.nftPrice}', 25),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, top: 20),
            child: Text(
                '${widget._nftDetails.nftDescription}' +
                    Strings.constantNFTDescription,
                style: GoogleFonts.roboto(
                  textStyle:
                      const TextStyle(fontSize: 17, color: Colors.black54),
                )),
          ),
          SizedBox(
            height: 50,
          ),
          _auctionWidget('${widget._nftDetails.nftPrice}', Strings.constantTime,
              '${widget._nftDetails.nftName}', "0xag23mvd...")
        ],
      ),
    );
  }

  Widget _displayNftImage(String imageAddress) {
    return InkWell(
      onTap: () =>
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
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

  Widget _auctionWidget(
      String price, String time, String date, String tokenID) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => DetailsPage(tokenID))),
      child: Container(
          height: 140,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              children: [
                _customText('${Strings.auctionText}', 20),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    customColumn('Token ID', '$tokenID', 15),
                    customColumn('Price', 'Ξ250', 22),
                    customColumn('Starts From', '20', 22),
                  ],
                )
              ],
            ),
          )),
    );
  }

  Widget _customFloatingActionButton(String title) {
    return Align(
      alignment: Alignment.bottomRight,
      child: InkWell(
        onTap: () {


          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentsPage(_nftDetails)));

        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0, left: 40),
          child: Container(
            width: 170,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.yellow.shade800 , width: 2),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.local_offer_outlined),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
