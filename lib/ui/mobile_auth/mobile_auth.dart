import 'dart:ui' as ui;

import 'package:boilerplate/stores/auth/auth_store.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/custom_buttons.dart';
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
  final String resendCode = "Resend code";

  TextEditingController _mobileNumberController = TextEditingController();

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
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 50,
          ),
          Align(alignment: Alignment.centerLeft, child: _customIconWidget()),
          SizedBox(height: 50.0),
          _welcomeText(),
          _subInfoText(),
          SizedBox(height: 25.0),
          _customTextField(
              _mobileNumberController, Icons.phone_iphone, '+91', false),
          SizedBox(height: 50.0),
          _submitButton(),
        ]),
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

  Widget _submitButton() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: InkWell(
          onTap: () => Navigator.of(context).pushNamed(Routes.verifyOTP),
          child: CustomButton(
            color: Colors.indigo.shade600,
            buttonText: 'submit'.toUpperCase(),
            horizontalMargin: 0,
          ),
        ));
  }

  Widget _customTextField(TextEditingController controller, IconData icon,
      String hintText, bool isObscure) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller,
          textDirection: ui.TextDirection.ltr,
          keyboardType: TextInputType.number,
          obscureText: isObscure,
          decoration: InputDecoration(
              hintText: hintText,
              icon: Icon(
                icon,
                color: Colors.grey.shade600,
              )),
          // onChanged: (value) => controller.text = value,
          onFieldSubmitted: (value) => controller.text = value,
        ),
      ),
    );
  }

}
