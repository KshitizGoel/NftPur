import 'package:boilerplate/stores/blockchain/blockchain_store.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
    return ListView(
      children: [
        SizedBox(
          height: 50,
        ),
        customProgressIndicator(),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text('Getting your wallet details here !!!!!'),
        ),
      ],
    );
  }
}
