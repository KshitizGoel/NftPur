import 'package:boilerplate/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 250,
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Icon(
                          Icons.verified_sharp,
                          color: Colors.yellow.shade700,
                        ))),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: CustomText(
                      'Congratulations your NFT has been successfully created',
                      true),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child:
                      CustomText('Details will be given at your E-mail', true),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
