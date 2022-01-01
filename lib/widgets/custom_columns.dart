import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customColumn(String heading, String data , double fontSize) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          heading,
          style: GoogleFonts.italiana(
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20)),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 5),
        child: Text(
          data,
          style: TextStyle(
               color: Colors.black, fontSize: fontSize),
        ),
      )
    ],
  );
}
