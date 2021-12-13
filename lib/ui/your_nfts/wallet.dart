import 'package:flutter/material.dart';

/// TODO : This wallet is supposed to be
class PublicWallet extends StatefulWidget {
  const PublicWallet({Key? key}) : super(key: key);

  @override
  _PublicWalletState createState() => _PublicWalletState();
}

/// TODO : A simple Wallet UI which will be displayed if the user has not signed in with their wallet in the first place!!!!

class _PublicWalletState extends State<PublicWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text('your wallet and details will be displayed here!!!'),
            )
          ],
        ));
  }
}
