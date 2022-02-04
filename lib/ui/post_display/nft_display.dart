import 'package:boilerplate/models/nft/nft_details.dart';
import 'package:flutter/material.dart';

class NftDisplay extends StatefulWidget {
  final NFTData _nftData;
  final bool isAvailable;

  NftDisplay(this._nftData, this.isAvailable);

  @override
  _NftDisplayState createState() => _NftDisplayState();
}

class _NftDisplayState extends State<NftDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              _appBarTab(),
              SizedBox(
                height: 40,
              ),
              _nftDisplayWidget(),
              SizedBox(
                height: 20,
              ),
              _ownerTab(),
            ],
          ),
          _placeABidWidget(),
        ],
      ),
    );
  }

  Widget _appBarTab() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: _customIconButton(Icon(Icons.arrow_back))),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Text(
                'Available to bid',
                style: TextStyle(
                    color: Colors.green.shade600, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          _customIconButton(Icon(Icons.workspaces_outline)),
        ],
      ),
    );
  }

  Widget _customIconButton(Icon icon) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: icon,
      ),
    );
  }

  Widget _nftDisplayWidget() {
    return Container(
      height: 325,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.blueGrey.shade200, blurRadius: 20, spreadRadius: 10)
        ],
        gradient: LinearGradient(
            colors: [Colors.lightBlueAccent.shade200, Colors.blue.shade900]),
      ),
    );
  }

  Widget _ownerTab(){
    return Container(

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade100,
                              spreadRadius: 5,
                              blurRadius: 10)
                        ],
                        shape: BoxShape.circle),

                    ///TODO: IMAGE OF THE NFT OWNER
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        "assets/images/nft_owner_image.png",
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ),
                _nameAndProfileDetails('Ryan Bergson', 'Creator'),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget _nameAndProfileDetails(String name, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              '$name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Text(
            '$price',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }



  Widget _placeABidWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 300,
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade900,
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            'Place a bid',
            style: TextStyle(
                // fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18),
          ),
        ),
      ),
    );
  }
}
