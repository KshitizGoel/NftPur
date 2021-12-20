import 'package:boilerplate/constants/sample_data_file.dart';
import 'package:boilerplate/models/nft/nft_details.dart';
import 'package:boilerplate/ui/post_display/nft_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NftList extends StatefulWidget {
  const NftList({Key? key}) : super(key: key);

  @override
  _NftListState createState() => _NftListState();
}

class _NftListState extends State<NftList> {
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

          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NftDisplay(_nftDetails, true)));
        },
        child: Container(
            height: 150,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                        "Ξ ${post["price"]}",
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        ),
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Latest Releases',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.orangeAccent,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          _buildListOfNewNFTs()
        ],
      ),
    );
  }

  Widget _buildListOfNewNFTs() {
    return ListView.builder(
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
        });
  }
}
