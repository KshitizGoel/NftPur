import 'package:boilerplate/stores/auth/auth_store.dart';
import 'package:boilerplate/stores/blockchain/blockchain_store.dart';
import 'package:boilerplate/ui/your_profile/add_your_wallet.dart';
import 'package:boilerplate/ui/your_profile/wallet_details.dart';
import 'package:boilerplate/widgets/empty_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  late BlockchainStore _blockchainStore;
  late AuthStore _authStore;

  final List<Widget> _children = [
    AddYourWallet(),
    WalletDetails(),
  ];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _blockchainStore = Provider.of<BlockchainStore>(context);
    _authStore = Provider.of<AuthStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(),
      body: Observer(
        builder: (context) {
          return _authStore.hasWallet ? _children[1] : _children[0];
        },
      ),
    );
  }
}
