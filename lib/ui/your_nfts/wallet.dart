import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            Center(child: _customText('Integrate your wallet', 20)),
            SizedBox(
              height: 20,
            ),
            _integrateWalletContainer(Assets.metamaskLogo, 'MetaMask Wallet'),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                'More wallets integration to be done in the future!!!',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
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

  Widget _integrateWalletContainer(String imageAddress, String walletName) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.mainScreen, (Route<dynamic> route) => false),
      child: Container(
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 70,
                    width: 90,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        imageAddress,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      walletName,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.orangeAccent,
                  )
                ],
              ))),
    );
  }
}
