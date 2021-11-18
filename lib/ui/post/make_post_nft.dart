import 'dart:io';

import 'package:boilerplate/constants/strings.dart';
import 'package:boilerplate/ui/success_screen/success_screen.dart';
import 'package:boilerplate/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class MakePostNft extends StatefulWidget {
  final XFile _mediaFile;

  MakePostNft(this._mediaFile);

  @override
  _MakePostNftState createState() => _MakePostNftState(_mediaFile);
}

class _MakePostNftState extends State<MakePostNft> {
  final XFile _mediaFile;

  final TextEditingController _descriptionController = TextEditingController();

  get borderRadius => BorderRadius.circular(8.0);

  // final TextEditingController _descriptionController = TextEditingController();
  _MakePostNftState(this._mediaFile);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Create NFT',
            style: GoogleFonts.italiana(
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 23),
            )),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ],
              border: Border.all(
                color: Colors.blueGrey.withOpacity(0.70),
                //                   <--- border color
                width: 10.0,
              ),
            ),
            child: Image.file(File(_mediaFile.path)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: CustomTextField(_descriptionController, 'NFT Description'),
          ),
          Center(
            child: Text(
              'More custom inputs will be coming!!!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _customButtonForVerification('Create NFT', Icons.verified_sharp),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _customButtonForVerification(String text, IconData icon) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SuccessScreen(Strings.congratulationsText))),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 100),
        decoration: BoxDecoration(
            color: Colors.yellow.shade700,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 5.0),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      icon,
                      color: Colors.blueAccent,
                      size: 15,
                    ),
                  )),
              Text(
                text,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
