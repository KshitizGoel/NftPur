import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'make_post_nft.dart';

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
              width: 180,
              decoration: BoxDecoration(
                  color: Colors.yellow.shade700,
                  borderRadius: BorderRadius.circular(40)),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
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
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 15),
            child: _customText('Saved Posts', 20),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 15),
            child: _customText('Favourites', 20),
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
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MakePostNft(image!)));
  }
}
