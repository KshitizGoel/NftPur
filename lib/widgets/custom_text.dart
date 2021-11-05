import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {

  final String nftName  ;
  final bool isBold;
  CustomText(this.nftName , this.isBold  );
  @override
  Widget build(BuildContext context) {
    return Text(
      nftName,
      style: GoogleFonts.roboto(
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal ,
        color: Colors.black
      ),
    );
  }
}
