import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/sample_data_file.dart';
import 'package:boilerplate/ui/post_display/nft_display.dart';
import 'package:boilerplate/widgets/custom_text.dart';
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
      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
          )));
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
            .push(MaterialPageRoute(builder: (context) => NftDisplay()));
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

  Widget _newNFTToPurchase() {
    return Column(
      // physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      // shrinkWrap: true,
      children: [
        _customNFTBiddingItem(),
        _customNFTBiddingItem(),
        _customNFTBiddingItem(),
      ],
    );
  }

  Widget _customNFTBiddingItem() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: InkWell(
          onTap: () => print('Button Tapped'),
          child: Container(
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    colors: [
                      Colors.orange.shade100.withOpacity(0.20),
                      Colors.deepOrange.shade700.withOpacity(0.50)
                    ],
                    // begin: const FractionalOffset(0.0, 0.0),
                    // end: const FractionalOffset(0.5, 0.0),
                    // stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
                boxShadow: [
                  BoxShadow(
                    color: Colors.yellow.shade700,
                    blurRadius: 2,
                    offset: Offset(4, 8), // Shadow position
                  ),
                ],
              ),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 25),
                      child: Container(
                        height: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            Assets.nftpurLogo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 15),
                    child: Column(
                      children: [
                        CustomText('Sea Caricature', true),
                        Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: CustomText('NFT Title', true)),

                        // Row(
                        //   children: [
                        //
                        //     _customTallyWidget('tally', 'data'),
                        //     _customTallyWidget('tally', 'data'),
                        //     _customTallyWidget('tally', 'data'),
                        //     _customTallyWidget('tally', 'data'),
                        //
                        //   ],
                        // )
                      ],
                    ),
                  )
                ],
              )),
        ));
  }

  Widget _customTallyWidget(String tally, String data) {
    return Column(
      children: [
        Text(tally),
        Text(data),
      ],
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
