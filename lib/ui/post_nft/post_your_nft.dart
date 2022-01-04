import 'package:boilerplate/constants/strings.dart';
import 'package:boilerplate/models/nft/nft_details.dart';
import 'package:boilerplate/stores/blockchain/blockchain_store.dart';
import 'package:boilerplate/ui/post_display/nft_display.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'mint_nft.dart';

class PostYourNft extends StatefulWidget {
  const PostYourNft({Key? key}) : super(key: key);

  @override
  _PostYourNftState createState() => _PostYourNftState();
}

class _PostYourNftState extends State<PostYourNft> {
  final ImagePicker _picker = ImagePicker();

  late BlockchainStore _blockchainStore;

  @override
  Future<void> didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _blockchainStore = Provider.of<BlockchainStore>(context);
    await _blockchainStore.getDataFromStorage();
  }

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
                  border: Border.all(color: Colors.yellow.shade800, width: 2),
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
          SizedBox(
            height: 20,
          ),
          Observer(builder: (context) {
            return _blockchainStore.loading
                ? customProgressIndicator()
                : _buildUploadBody();
          }),
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
    var image = await _picker.pickImage(source: ImageSource.gallery);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MintNFT(image!)));
  }

  Widget _buildUploadBody() {
    return Container(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: _blockchainStore.nftDetailsList!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: _customNFTPosts(
                  '${_blockchainStore.nftDetailsList![index].imageUrl}',
                  '${_blockchainStore.nftDetailsList![index].nftName}',
                  '20.99'),
            );
          }),
    );
  }

  Widget _customNFTPosts(String assetName, String nftName, String price) {
    return assetName == 'imageUrl'
        ? SizedBox(
            height: 0,
          )
        : InkWell(
            onTap: () {
              NFTData nftDetails = NFTData(
                  nftName: nftName,
                  imageAddress: assetName,
                  nftDescription: Strings.constantNFTDescription,
                  nftPrice: price);

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NftDisplay(nftDetails, false)));
            },
            child: Ink(
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: assetName,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                            strokeWidth: 1, value: downloadProgress.progress),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      // child: Image.network(
                      //   assetName,
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
