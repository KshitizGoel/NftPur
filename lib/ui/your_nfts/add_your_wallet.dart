import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddYourWallet extends StatefulWidget {
  @override
  _AddYourWalletState createState() => _AddYourWalletState();
}

class _AddYourWalletState extends State<AddYourWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add your wallet',
          style: GoogleFonts.italiana(
              textStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
         backgroundColor: Colors.yellow.shade800.withOpacity(0.70),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          _addYourWalletContainer(),
          SizedBox(height: 20,),
          Center(child: Text('Please proceed to make your own wallet!' ,style: TextStyle(fontSize: 15),))
        ],
      ),
    );
  }

  Widget _addYourWalletContainer() {
    return InkWell(
      onTap: () => FlushbarHelper.createSuccess(
          message: 'Your Wallet making is in progress!'),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
          child: Icon(
            Icons.add_circle_outline_outlined,
            color: Colors.grey.shade800,
            size: 100,
          ),
        ),
      ),
    );
  }
}
