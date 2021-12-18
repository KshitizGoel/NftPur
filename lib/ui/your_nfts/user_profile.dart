import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/models/nft/nft_details.dart';
import 'package:boilerplate/stores/auth/auth_store.dart';
import 'package:boilerplate/ui/post_display/nft_display.dart';
import 'package:boilerplate/ui/your_nfts/wallet.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/custom_columns.dart';
import 'package:boilerplate/widgets/custom_logo.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late AuthStore _authStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _authStore = Provider.of<AuthStore>(context);
    _authStore.getUserDetails();
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
      body: ListView(
        children: [
          SizedBox(
            height: 100,
          ),
          _authStore.firebaseUser!.providerData.first.photoURL != null
              ? InkWell(
                  onTap: () =>
                      Navigator.of(context).pushNamed(Routes.addYourWallet),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 120),
                    height: 150,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.lightBlueAccent.shade100,
                          Colors.blueAccent
                        ]),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          _authStore.firebaseUser!.providerData.first.photoURL!,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                )
              : CustomLogo(150),
          SizedBox(
            height: 20,
          ),
          _authStore.firebaseUser?.displayName != null
              ? Center(
                  child: Text(_authStore.firebaseUser!.displayName!,
                      style: GoogleFonts.italiana(
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      )),
                )
              : customProgressIndicator(),
          SizedBox(
            height: 20,
          ),
          _authStore.firebaseUser?.email != null
              ? Center(
                  child: Text(_authStore.firebaseUser!.email!,
                      style: GoogleFonts.italiana(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: Colors.blueAccent),
                      )),
                )
              : CircularProgressIndicator(
                  strokeWidth: 5,
                ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => PublicWallet())),
            child: Container(
                height: 100,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withAlpha(100), blurRadius: 10.0),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
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
      ),
    );
  }

  Widget _yourOwnNFTs() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        physics: ScrollPhysics(),
        crossAxisCount: 3,
        shrinkWrap: true,
        children: List.generate(9, (index) {
          NftDetails _nftDetails = NftDetails(
              nftName: 'Gangsta Rodeo',
              imageAddress: Assets.nftPicture3,
              nftDescription:
                  'Hi this is the random text about the NFT above !',
              nftPrice: '256');

          return _showNFTContent(_nftDetails);
        }),
      ),
    );
  }

  Widget _showNFTContent(NftDetails _nftDetails) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NftDisplay(_nftDetails, false))),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
          ],
          border: Border.all(
            width: 2.0,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            _nftDetails.imageAddress,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
