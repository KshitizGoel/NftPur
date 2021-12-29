import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'mint_nft.dart';

class PostYourNft extends StatefulWidget {
  const PostYourNft({Key? key}) : super(key: key);

  @override
  _PostYourNftState createState() => _PostYourNftState();
}

class _PostYourNftState extends State<PostYourNft> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: InkWell(
          onTap: () async {
            _pickImageAndNavigate();
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0, left: 40),
            child: Container(
              width: 195,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.yellow.shade800,
                    width: 2
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.add_a_photo_outlined),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'POST YOUR NFT',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
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
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 15),
            child: _customText('Your Collections', 25),
          ),
        ],
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

  Future<void> _pickImageAndNavigate() async {
    var image = await _picker.pickImage(source: ImageSource.gallery) ;
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MintNFT(image!)));
  }
}
