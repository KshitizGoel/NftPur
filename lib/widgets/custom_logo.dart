import 'package:flutter/material.dart';

import 'app_icon_widget.dart';

class CustomLogo extends StatelessWidget {
  final double width;

  CustomLogo(this.width);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        decoration: BoxDecoration(color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppIconWidget(image: 'assets/images/nftpur_sample_logo.jpg'),
        ));
  }
}
