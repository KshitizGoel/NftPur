import 'dart:ui' as ui;

import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({Key? key}) : super(key: key);

  @override
  _VerifyOTPState createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  final String verificationText = 'Verification';
  final String verificationText2 = 'Please enter the code we sent';
  TextEditingController otpController = TextEditingController();
  final String resendCode = "Didn't received yet? Resend";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildMainBody(),
    );
  }

  Widget _buildMainBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children: [
          SizedBox(
            height: 25,
          ),
          Align(alignment: Alignment.centerLeft, child: _customIconWidget()),
          SizedBox(height: 50.0),
          _verificationText(),
          _subInfoText(),
          SizedBox(height: 25.0),
          _customTextField(otpController, Icons.code, 'Enter code', true),
          SizedBox(height: 25.0),
          _resendCode(),
          _confirmButton()
        ],
      ),
    );
  }

  Widget _customIconWidget() {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(Routes.mobileAuth),
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

  Widget _verificationText() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        // margin: EdgeInsets.only(bottom: 20),
        child: Text(
          verificationText,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
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
          verificationText2,
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),
      ),
    );
  }

  Widget _customTextField(TextEditingController controller, IconData icon,
      String hintText, bool isObscure) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          maxLength: 6,

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

  Widget _resendCode() {
    return InkWell(
      ///TODO : Resending the code again!
      onTap: () => null,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.only(top: 10, bottom: 30),
          child: Text(
            resendCode,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
      ),
    );
  }

  Widget _confirmButton() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: InkWell(
          onTap: () => Navigator.of(context).pushNamed(Routes.mainScreen),
          child: CustomButton(
            color: Colors.lightGreen.shade600,
            buttonText: 'confirm'.toUpperCase(),
            horizontalMargin: 0,
          ),
        ));
  }
}
