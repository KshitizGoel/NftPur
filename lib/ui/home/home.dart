import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/ui/post_display/nft_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: false,
        title: Text('NFTPur',
            style: GoogleFonts.italiana(
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25),
            )),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState!.openDrawer(),
            color: Colors.black,
          ),
        ],
      ),
      drawer: _customDrawer(),
      body: ListView(
        children: [
          _storiesFeature(),
          _latestPostText(),
          SizedBox(
            height: 20,
          ),
          _showCaseNftHorizontalList(),
        ],
      ),
    );
  }

  Widget _storiesFeature() {
    return Container(
      height: 85.0,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          /// TODO : Populate the list here with popular NFTs!
          _customPictures(),
          _customPictures(),
          _customPictures(),
          _customPictures(),
          _customPictures(),
        ],
      ),
    );
  }

  Widget _customPictures() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10, right: 5),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.yellow[600], borderRadius: BorderRadius.circular(50)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              Assets.profilePicture,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _latestPostText() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 15, bottom: 10),
      child: Text('Latest NFTs',
          style: GoogleFonts.italiana(
            textStyle: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          )),
    );
  }

  Widget _showCaseNftHorizontalList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _customNFTPosts(Assets.nftPicture1),
            _customNFTPosts(Assets.nftPicture2),
            _customNFTPosts(Assets.nftPicture3),
            _customNFTPosts(Assets.nftPicture4),
          ],
        ),
      ),
    );
  }

  Widget _customNFTPosts(String assetName) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => NFTDisplayScreen()));
      },
      child: Ink(
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Container(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                assetName,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// TODO : To be changed here!
  Widget _customDrawer() {
    return ListView(
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Drawer Header'),
        ),
        ListTile(
          title: const Text('Item 1'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Item 2'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
