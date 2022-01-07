import 'package:flutter/material.dart';

class FullSizeDisplay extends StatefulWidget {
  final String imageAddress;

  FullSizeDisplay(this.imageAddress);

  @override
  _FullSizeDisplayState createState() => _FullSizeDisplayState(imageAddress);
}

class _FullSizeDisplayState extends State<FullSizeDisplay> {
  final String imageAddress;

  _FullSizeDisplayState(this.imageAddress);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: InteractiveViewer(
          panEnabled: false,
          // Set it to false
          boundaryMargin: EdgeInsets.all(100),
          minScale: 0.5,
          maxScale: 2,
          child: imageAddress.substring(0, 6).contains('https')
              ? Image.network(
                  "$imageAddress",
                  height: double.infinity,
                )
              : Image.asset(
                  "$imageAddress",
                  height: double.infinity,
                ),
        ),
      ),
    );
  }
}
