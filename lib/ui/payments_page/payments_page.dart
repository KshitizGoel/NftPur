import 'package:boilerplate/models/nft/nft_details.dart';
import 'package:boilerplate/ui/payments_page/payment_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaymentsPage extends StatefulWidget {
  NftDetails nftDetails;

  PaymentsPage(this.nftDetails);

  @override
  _PaymentsPageState createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  String nftTokenID = "0x9f4fa174ff0688386f12bf6fe1f78e5802718db09f96e4b607383810bb7c480b";

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
          _infoCard(),
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

  Widget _infoCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                '${widget.nftDetails.nftName}',
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                '${widget.nftDetails.nftDescription}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                'Ξ ${widget.nftDetails.nftPrice} /-',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                '$nftTokenID',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _purchaseNft() {
    return InkWell(
      onTap: () async => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PaymentSuccess(
              'Your Transaction details will be sent on your Email address!'))),
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
