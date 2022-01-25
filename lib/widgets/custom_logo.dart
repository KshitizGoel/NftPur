import 'package:flutter/material.dart';

import 'app_icon_widget.dart';

class CustomLogo extends StatelessWidget {
  final double width;

  CustomLogo(this.width);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: AppIconWidget(image: 'assets/images/nftpur_sample_logo.jpg'),
        ));
  }
}
