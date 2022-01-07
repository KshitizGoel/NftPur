import 'package:boilerplate/models/nft/nft_details.dart';
import 'package:boilerplate/models/user/user.dart';
import 'package:boilerplate/stores/auth/auth_store.dart';
import 'package:boilerplate/stores/blockchain/blockchain_store.dart';
import 'package:boilerplate/ui/post_display/nft_display.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/custom_columns.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:web3dart/credentials.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late AuthStore _authStore;
  late BlockchainStore _blockchainStore;

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    _authStore = Provider.of<AuthStore>(context);
    _blockchainStore = Provider.of<BlockchainStore>(context);
    await _blockchainStore.approveAndAllow(
        EthereumAddress.fromHex('0x61a02185c526cb869ab57c4e4cfdc5941f8c3f3a'));
    await _checkWalletAvailability();
    await _blockchainStore.getDataFromStorage();
  }

  Future<void> _checkWalletAvailability() async {
    UserData _userData = UserData(
        displayName: _authStore.firebaseUser!.displayName,
        email: _authStore.firebaseUser!.email,
        photoURL: _authStore.firebaseUser!.photoURL,
        uid: _authStore.firebaseUser!.uid);
    await _authStore.checkForTheAvailableWallet(_userData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('Public Wallet',
              style: GoogleFonts.italiana(
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 22),
              )),
          centerTitle: false,
          actions: [
            IconButton(
                onPressed: () {
                  _authStore.logoutTheUser();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(Routes.login, (route) => false);
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                ))
          ],
        ),
        body: Observer(
          builder: (context) {
            return _authStore.firebaseUser!.providerData.first.photoURL !=
                        null &&
                    _authStore.firebaseUser?.displayName != null &&
                    _authStore.firebaseUser?.email != null
                ? _buildMainBody()
                : Center(child: customProgressIndicator());
          },
        ));
  }

  Widget _buildMainBody() {
    return ListView(
      children: [
        SizedBox(
          height: 100,
        ),
        InkWell(
          onTap: () => Navigator.of(context).pushNamed(Routes.wallet),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 120),
            height: 150,
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.blue, blurRadius: 20.0),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  _authStore.firebaseUser!.providerData.first.photoURL!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text(_authStore.firebaseUser!.displayName!,
              style: GoogleFonts.italiana(
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              )),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text(_authStore.firebaseUser!.email!,
              style: GoogleFonts.italiana(
                textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: Colors.blueAccent),
              )),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () => Navigator.of(context).pushNamed(Routes.wallet),
          child: Container(
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withAlpha(100), blurRadius: 10.0),
                  ]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    customColumn('Your NFTs', '6', 25),
                    customColumn('Wallet', '250', 25),
                    customColumn('Followers', '9', 25),
                  ],
                ),
              )),
        ),
        Container(
          height: 20,
        ),
        _yourOwnNFTs(),
      ],
    );
  }

  Widget _yourOwnNFTs() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        physics: ScrollPhysics(),
        crossAxisCount: 3,
        shrinkWrap: true,
        children:
            List.generate(_blockchainStore.nftDetailsList!.length, (index) {
          NFTData _nftDetails = NFTData(
              nftName: _blockchainStore.nftDetailsList![index].nftName,
              imageAddress: _blockchainStore.nftDetailsList![index].imageUrl,
              nftDescription:
                  'Hi this is the random text about the NFT above !',
              nftPrice: '256');

          return _showNFTContent(_nftDetails);
        }),
      ),
    );
  }

  Widget _showNFTContent(NFTData _nftDetails) {
    return _nftDetails.imageAddress == "imageUrl"
        ? SizedBox(
            height: 0,
          )
        : InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NftDisplay(_nftDetails, false))),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withAlpha(100), blurRadius: 10.0),
                ],
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 1.0,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  _nftDetails.imageAddress,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
  }
}
