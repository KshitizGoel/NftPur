import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/custom_buttons.dart';
import 'package:boilerplate/widgets/custom_logo.dart';
import 'package:flutter/material.dart';

class LetsGetStarted extends StatefulWidget {
  const LetsGetStarted({Key? key}) : super(key: key);

  @override
  _LetsGetStartedState createState() => _LetsGetStartedState();
}

class _LetsGetStartedState extends State<LetsGetStarted> {
  final String start = "Let's Get\nStarted";
  final String start2 = "Everything NFT here!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          InkWell(
            ///TODO: Will be navigating the user directly to the market place, but without any login!

            onTap: () => Navigator.of(context).pushNamed(Routes.mobileAuth),
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                    // color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      'Skip >'.toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600),
                    ),
                  ),
                )),
          )
        ],
        leading: CustomLogo(0),
      ),
      backgroundColor: Colors.white,
      body: _buildMainBody(),
    );
  }

  Widget _buildMainBody() {
    return ListView(
      children: [
        Container(
            // height: 450,
            child: Column(
          children: [
            _customCircularContainers(
                Colors.lightBlueAccent.shade100, Colors.blueAccent, 50),
            SizedBox(
              height: 30,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: _customCircularContainers(
                      Colors.orangeAccent.shade100, Colors.deepOrange, 75),
                )),
            SizedBox(
              height: 5,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: _customCircularContainers(
                      Colors.greenAccent.shade100, Colors.green, 110),
                )),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: _customCircularContainers(
                      Colors.indigoAccent.shade100, Colors.indigo, 150),
                )),
          ],
        )),
        SizedBox(
          height: 40,
        ),
        _customStartText(),
        _customStartText2(),
        Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () => Navigator.of(context).pushNamed(Routes.login),
              child: CustomButton(
                  color: Colors.black,
                  buttonText: 'Sign Up',
                  horizontalMargin: 20),
            ))
      ],
    );
  }

  Widget _customStartText() {
    return Container(
      margin: EdgeInsets.only(left: 20, bottom: 15),
      child: Text(
        start,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
      ),
    );
  }

  Widget _customStartText2() {
    return Container(
      margin: EdgeInsets.only(left: 20, bottom: 30),
      child: Text(
        start2,
        style: TextStyle(color: Colors.grey, fontSize: 17),
      ),
    );
  }

  Widget _customCircularContainers(
      Color color1, Color color2, double containerHeight) {
    return Container(
      height: containerHeight,
      width: containerHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: LinearGradient(colors: [color1, color2])),
    );
  }
}
