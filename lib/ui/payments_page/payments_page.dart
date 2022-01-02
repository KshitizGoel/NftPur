import 'package:boilerplate/models/nft/nft_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaymentsPage extends StatefulWidget {
  NftDetails nftDetails;

  PaymentsPage(this.nftDetails);

  @override
  _PaymentsPageState createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.orange.shade700,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: [

          Container(
            height: 300,
            child: Center(child: _customImageContainer()),

          ),
          // _customContainerForText('${widget.nftDetails.nftDescription}'),
          SizedBox(height: 50),
          _purchaseNft(),
        ],
      ),
    );
  }

  Widget _customImageContainer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.blue, blurRadius: 20.0),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(widget.nftDetails.imageAddress),
        ),
      ),
    );
  }

  Widget _purchaseNft() {
    return InkWell(
      onTap: () => null,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.yellow.shade800, width: 2),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Ξ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18),
                ),
                Text(
                  'Proceed To Payment',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
