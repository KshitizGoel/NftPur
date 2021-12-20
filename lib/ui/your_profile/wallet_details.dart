import 'package:boilerplate/stores/blockchain/blockchain_store.dart';
import 'package:boilerplate/ui/nft_list/nft_list.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WalletDetails extends StatefulWidget {
  @override
  _WalletDetailsState createState() => _WalletDetailsState();
}

class _WalletDetailsState extends State<WalletDetails> {
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
          elevation: 0,
          title: Text(
            'NFTPur Wallet',
            style: GoogleFonts.italiana(
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
          ),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: Observer(
          builder: (context) {
            return _blockchainStore.hasWallet
                ? _buildMainBody()
                : customProgressIndicator();
          },
        ));
  }

  Widget _buildMainBody() {
    return Stack(
      children: [
        ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            _availableBalance(),
            SizedBox(
              height: 30,
            ),
            //_walletDetails(),
            // SizedBox(
            //   height: 20,
            // ),
            _buyNft()
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _customButtonForTransactions('deposit'.toUpperCase()),
                _customButtonForTransactions('withdraw'.toUpperCase()),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _availableBalance() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      height: 90,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
        child: Align(
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Available Balance',
                    style: GoogleFonts.italiana(
                        textStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Ξ 250',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Center(
                child: IconButton(
                  icon: Icon(
                    Icons.info_outlined,
                    color: Colors.grey.shade700,
                  ),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (_) => Container(
                      height: 50,
                      margin:
                          EdgeInsets.symmetric(vertical: 250, horizontal: 50),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 10)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Center(
                            child: Text(
                                'Hi here you will receive the details about the currency and it\'s comparison with Indian ruppees!')),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _walletDetails() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text('Not sure to be displayed!!!!'),
        ));
  }

  Widget _buyNft() {
    return Center(
      child: InkWell(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => NftList())),
        child: Container(
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
              child: Text(
                'Buy NFTs',
                style: TextStyle(
                  color: Colors.yellow.shade700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _customButtonForTransactions(String text) {
    return Container(
      height: 50,
      width: 150,
      decoration: BoxDecoration(
          color: Colors.yellow.shade700.withOpacity(0.70),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Text(
            '$text',
            style: TextStyle(
             // fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
