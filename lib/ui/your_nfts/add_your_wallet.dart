import 'package:boilerplate/stores/blockchain/blockchain_store.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddYourWallet extends StatefulWidget {
  @override
  _AddYourWalletState createState() => _AddYourWalletState();
}

class _AddYourWalletState extends State<AddYourWallet> {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add your wallet',
          style: GoogleFonts.italiana(
              textStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        backgroundColor: Colors.yellow.shade800.withOpacity(0.70),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          _addYourWalletContainer(),
          SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            'Please proceed to make your own wallet!',
            style: TextStyle(fontSize: 15),
          ))
        ],
      ),
    );
  }

  Widget _addYourWalletContainer() {
    return InkWell(
      onTap: () => _blockchainStore.generateANewWalletAddress(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
          child: Icon(
            Icons.add_circle_outline_outlined,
            color: Colors.grey.shade800,
            size: 100,
          ),
        ),
      ),
    );
  }
}
