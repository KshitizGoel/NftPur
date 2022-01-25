import 'package:boilerplate/stores/auth/auth_store.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileAuth extends StatefulWidget {
  @override
  _MobileAuthState createState() => _MobileAuthState();
}

class _MobileAuthState extends State<MobileAuth> {
  late AuthStore _authStore;

  final String welcomeText = "Welcome to NFTpur!";
  final String welcomeText2 = "Please complete your mobile number verification";

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _authStore = Provider.of<AuthStore>(context);
    // _authStore.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildMainBody(),
    );
  }

  Widget _buildMainBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Align(alignment: Alignment.centerLeft, child: _customIconWidget()),
            SizedBox(height: 50.0),
            _welcomeText(),
            _subInfoText(),
          ],
        ),
      ),
    );
  }

  Widget _customIconWidget() {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(Routes.login),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.grey.shade600,
          ),
        ),
      ),
    );
  }

  Widget _welcomeText() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        // margin: EdgeInsets.only(bottom: 20),
        child: Text(
          welcomeText,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
        ),
      ),
    );
  }

  Widget _subInfoText() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 30),
        child: Text(
          welcomeText2,
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),
      ),
    );
  }
}
