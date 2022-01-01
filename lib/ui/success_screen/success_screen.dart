import 'package:boilerplate/stores/post/nft_store.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/custom_text.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SuccessScreen extends StatefulWidget {
  final String progressString;

  SuccessScreen(this.progressString);

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  late NFTStore _nftStore;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _nftStore = Provider.of<NFTStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context)
                .pushNamedAndRemoveUntil(Routes.makeYourNFT, (route) => false),
          ),
        ),
        body: Observer(
          builder: (context) {
            return _nftStore.uploadSuccess
                ? _buildMainBody()
                : customProgressIndicator();
          },
        ));
  }

  Widget _buildMainBody() {
    return ListView(
      children: [
        SizedBox(
          height: 150,
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Icon(
                        Icons.verified_sharp,
                        size: 40,
                        color: Colors.deepOrangeAccent,
                      ))),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                child: CustomText('${widget.progressString}', false),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                child:
                    CustomText('Details will be given at your E-mail', false),
              )
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        InkWell(
          onTap: () => Navigator.of(context)
              .pushNamedAndRemoveUntil(Routes.mainScreen, (route) => false),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.yellow.shade800, width: 2),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Continue'.toUpperCase(),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
