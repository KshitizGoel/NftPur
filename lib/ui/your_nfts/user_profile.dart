import 'dart:io';

import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/models/nft/nft_details.dart';
import 'package:boilerplate/ui/post_display/nft_display.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/custom_columns.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Public Wallet',
            style: GoogleFonts.italiana(
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 22),
            )),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () =>
                  SharedPreferences.getInstance().then((preference) {
                    preference.setBool(Preferences.is_logged_in, false);
                    Navigator.of(context).pushReplacementNamed(Routes.login);
                  }),
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 120),
            height: 150,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.yellow.shade500, Colors.deepOrangeAccent]),
                borderRadius: BorderRadius.circular(50)),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  Assets.profilePicture,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text('Kshitiz Goel',
                style: GoogleFonts.italiana(
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w900),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text('kshitizgoel11@gmail.com',
                style: GoogleFonts.italiana(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      color: Colors.blueAccent),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 100,
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
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    customColumn('Your NFTs', '6', 25),
                    customColumn('Wallet', '250', 25),
                    customColumn('Followers', '9', 25),
                  ],
                ),
              )),
          Container(
            height: 20,
          ),
          _yourOwnNFTs(),
        ],
      ),
    );
  }


  Widget _yourOwnNFTs() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        physics: ScrollPhysics(),
        crossAxisCount: 3,
        shrinkWrap: true,
        children: List.generate(9, (index) {
          NftDetails _nftDetails = NftDetails(
              nftName: 'Gangsta Rodeo',
              imageAddress: Assets.nftPicture3,
              nftDescription:
              'Hi this is the random text about the NFT above !',
              nftPrice: '256');

          return _showNFTContent(_nftDetails);
        }),
      ),
    );
  }

  Widget _showNFTContent(NftDetails _nftDetails) {
    return InkWell(
      onTap: ()=>Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => NftDisplay(_nftDetails))),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
         decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
          ],
          border: Border.all(
            width: 2.0,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            _nftDetails.imageAddress,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
