import 'dart:io';

import 'package:boilerplate/constants/strings.dart';
import 'package:boilerplate/models/nft/nft_details.dart';
import 'package:boilerplate/stores/blockchain/blockchain_store.dart';
import 'package:boilerplate/ui/success_screen/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class MintNFT extends StatefulWidget {
  final XFile _mediaFile;

  MintNFT(this._mediaFile);

  @override
  _MintNFTState createState() => _MintNFTState(_mediaFile);
}

class _MintNFTState extends State<MintNFT> {
  final XFile _mediaFile;
  var _currentHorizontalIntValue = 10;

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  get borderRadius => BorderRadius.circular(8.0);

  _MintNFTState(this._mediaFile);

  late BlockchainStore _blockchainStore;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _blockchainStore = Provider.of<BlockchainStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade800,
        title: Text('Create NFT',
            style: GoogleFonts.italiana(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            )),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
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
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.blueAccent, blurRadius: 10.0),
              ],
              border: Border.all(
                color: Colors.indigo,
                width: 2.0,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                File(_mediaFile.path),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: _customTextField(_nameController, 'Name'),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: _customTextField(_descriptionController, 'Description'),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: NumberPicker(
              value: _currentHorizontalIntValue,
              minValue: 0,
              maxValue: 100,
              step: 10,
              itemHeight: 100,
              axis: Axis.horizontal,
              onChanged: (value) =>
                  setState(() => _currentHorizontalIntValue = value),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black26),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Current value : Ξ $_currentHorizontalIntValue',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )),
          ),
          SizedBox(height: 50),
          _customButtonForVerification('Mint NFT', Icons.verified_sharp),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _customButtonForVerification(String text, IconData icon) {
    return InkWell(
      onTap: () async {
        NFTMetaData nftMetaData = NFTMetaData(
            nftName: _nameController.text,
            nftDescription: _descriptionController.text,
            nftPrice: _currentHorizontalIntValue.toString());

        _blockchainStore.uploadNFTToDatabase(nftMetaData, widget._mediaFile);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) =>
                    SuccessScreen(Strings.congratulationsText.toUpperCase())),
            (route) => false);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.yellow.shade700, width: 2),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            )),
      ),
    );
  }

  Widget _customTextField(TextEditingController controller, String hintText) {
    return TextFormField(
        onChanged: (text) => controller.text = text,
        controller: controller,
        decoration: new InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
          prefixIcon: Icon(Icons.description),
          hintText: '$hintText',
        ));
  }
}
