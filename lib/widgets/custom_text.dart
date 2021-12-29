import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String nftName;

  final bool isBold;

  CustomText(this.nftName, this.isBold);

  @override
  Widget build(BuildContext context) {
    return Text(
      nftName,
      style: GoogleFonts.roboto(
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontSize: 15,
          color: Colors.black),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  CustomTextField(this.controller, this.hintText);

  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: (text) => controller.text = text,
        controller: controller,
        decoration: new InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colors.black, width: 1),
            ),
            prefixIcon: Icon(Icons.description),
            hintText: '$hintText',
            hintStyle: GoogleFonts.italiana(
                textStyle: TextStyle(fontWeight: FontWeight.bold))));
  }
}
