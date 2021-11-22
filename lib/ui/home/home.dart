import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/sample_data_file.dart';
import 'package:boilerplate/models/nft/nft_details.dart';
import 'package:boilerplate/ui/post_display/nft_display.dart';
import 'package:boilerplate/ui/stories_feature/stories_feature.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(InkWell(
        onTap: () {
          NftDetails _nftDetails = NftDetails(
              nftName: post["name"],
              imageAddress: "assets/images/${post["image"]}",
              nftDescription:
                  'Hi this is the random text about the NFT above !',
              nftPrice: post["price"].toString());

          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => NftDisplay(_nftDetails , true)));
        },
        child: Container(
            height: 150,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(post["name"],
                          style: GoogleFonts.italiana(
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          )),
                      Text(post["brand"],
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 17, color: Colors.black26),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "\$ ${post["price"]}",
                        style: const TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Image.asset(
                    "assets/images/${post["image"]}",
                    height: double.infinity,
                  )
                ],
              ),
            )),
      ));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
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
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          _storiesFeature(),
          _customRandomText('Latest NFTs'),
          // SizedBox(
          //   height: 20,
          // ),
          _showCaseNftHorizontalList(),
          SizedBox(
            height: 20,
          ),

          _customRandomText('NFTs for Sale'),

          ListView.builder(
              shrinkWrap: true,
              controller: controller,
              itemCount: itemsData.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                double scale = 1.0;
                if (topContainer > 0.5) {
                  scale = index + 0.5 - topContainer;
                  if (scale < 0) {
                    scale = 0;
                  } else if (scale > 1) {
                    scale = 1;
                  }
                }
                return Opacity(
                  opacity: scale,
                  child: Transform(
                    transform: Matrix4.identity()..scale(scale, scale),
                    alignment: Alignment.bottomCenter,
                    child: Align(
                        heightFactor: 0.7,
                        alignment: Alignment.topCenter,
                        child: itemsData[index]),
                  ),
                );
              }),
          SizedBox(
            height: 100,
          )
          // _newNFTToPurchase()
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
          _customPictures(Assets.profilePicture),
          _customPictures(Assets.profilePhoto1),
          _customPictures(Assets.profilePhoto2),
          _customPictures(Assets.profilePhoto3),
          _customPictures(Assets.profilePhoto4),
          _customPictures(Assets.profilePhoto5),
        ],
      ),
    );
  }

  Widget _customPictures(String imageAddress) {
    return InkWell(
      onTap: () =>
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return StoriesFeature();
      })),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10.0, bottom: 10, left: 10, right: 5),
        child: Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
              color: Colors.yellow[600],
              borderRadius: BorderRadius.circular(50)),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                imageAddress,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _customRandomText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 15, bottom: 10),
      child: Text('$text',
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
            _customNFTPosts(Assets.nftPicture1, 'Gangsta Rodeo', '12.99'),
            _customNFTPosts(Assets.nftPicture2, 'Bytes Mixture', '14.99'),
            _customNFTPosts(Assets.nftPicture3, 'Mane', '11.49'),
            _customNFTPosts(Assets.nftPicture4, 'Detective', '2.99'),
          ],
        ),
      ),
    );
  }

  Widget _customNFTPosts(String assetName, String nftName, String price) {
    return InkWell(
      onTap: () {
        NftDetails _nftDetails = NftDetails(
            nftName: nftName,
            imageAddress: assetName,
            nftDescription: 'Hi this is the random text about the NFT above !',
            nftPrice: price);

        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => NftDisplay(_nftDetails , true)));
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
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: ListView(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
                color: Colors.yellow.shade700,
                borderRadius: BorderRadius.circular(10)),
            child: Center(child: _customRandomTextTwo('Welcome to NFTPur')),
          ),
          _customDrawerTiles('Live Auctions'),
          _customDrawerTiles('Latest Deals'),
          _customDrawerTiles('New Creations'),
        ],
      ),
    );
  }

  Widget _customDrawerTiles(String text) {
    return InkWell(
      onTap: () => print('Drawer menu item is tapped!'),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.center,
              child: _customRandomTextTwo(text),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _customRandomTextTwo(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 10),
      child: Text('$text',
          style: GoogleFonts.italiana(
            textStyle: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          )),
    );
  }
}
