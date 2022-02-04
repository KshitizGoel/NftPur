import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/models/nft/nft_details.dart';
import 'package:boilerplate/ui/post_display/nft_display.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(), // new
        children: [
          SizedBox(
            height: 40,
          ),
          titleBar(),
          SizedBox(
            height: 30,
          ),
          _hotBidSegment(),
          Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: _hotBidNFTItems()),
          SizedBox(
            height: 30,
          ),
          _topSellerSegment(),
          _topSellerItems()
        ],
      ),
    );
  }

  Widget titleBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  '💹 25.0 ETH',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ),
              Text(
                'Find the best \nNFTArt 💥',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              )
            ],
          ),
          _customYourCartButton(),
        ],
      ),
    );
  }

  Widget _customYourCartButton() {
    return InkWell(
      onTap: () => null,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(Icons.shopping_bag_outlined),
        ),
      ),
    );
  }

  Widget _hotBidSegment() {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hot bid',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.5),
          ),
          InkWell(
              onTap: () => null,
              child: Text(
                'See all',
                style: TextStyle(color: Colors.green),
              ))
        ],
      ),
    );
  }

  Widget _hotBidNFTItems() {
    return Container(
      height: 310,
      width: 400,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.blueGrey.shade100, spreadRadius: 10, blurRadius: 20)
        ],
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          for (int i = 0; i < 4; i++) _nftWidget(),
        ],
      ),
    );
  }

  Widget _nftWidget() {
    return InkWell(
      onTap: () {
        NFTData _nftDetails = NFTData(
            nftName: 'nftName',
            imageAddress: Assets.newNft1,
            nftDescription: 'Hi this is the random text about the NFT above !',
            nftPrice: 'price');

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NftDisplay(_nftDetails, true)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.blueGrey.shade100, spreadRadius: 5, blurRadius: 10)
        ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 175,
                width: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(colors: [
                      Colors.lightBlueAccent.shade200,
                      Colors.blue.shade900
                    ]),
                    color: Colors.black),
                child: Text(
                  /// TODO: ADD THE IMAGE SUPPORT HERE !!!!
                  '',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  /// TODO: NFT Name
                  'Fakurian of Space',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  /// TODO: NFT owner name
                  'Ryan Bergson',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              _betWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget _betWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.trending_up,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Last bid',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              Text(
                '0.96 ETH',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () => null,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey.shade900,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.all(13.5),
              child: Text(
                'Place a bid',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _topSellerSegment() {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Top seller',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.5),
          ),
          InkWell(
              onTap: () => null,
              child: Text(
                'See all',
                style: TextStyle(color: Colors.green),
              ))
        ],
      ),
    );
  }

  Widget _topSellerItems() {
    return Column(
      children: [
        _sellerItems('Giana Philips', '\$57,890'),
        _sellerItems('Philip Shapiro', '\$123,420'),
      ],
    );
  }

  Widget _sellerItems(String name, String price) {
    return Container(
      height: 90,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.blueGrey.shade50, spreadRadius: 10, blurRadius: 10)
      ], borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade100,
                              spreadRadius: 5,
                              blurRadius: 10)
                        ],
                        shape: BoxShape.circle),

                    ///TODO: IMAGE OF THE NFT OWNER
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        "assets/images/nft_owner_image.png",
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ),
                _nameAndProfileDetails(name, price),
              ],
            ),
            _followButton(),
          ],
        ),
      ),
    );
  }

  Widget _nameAndProfileDetails(String name, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              '$name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Text(
            '$price',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _followButton() {
    return InkWell(
      onTap: () => null,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: Text(
            'Follow',
            style: TextStyle(
                color: Colors.grey.shade700, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
