import 'package:flutter/material.dart';

class CustomProgressIndicatorWidget extends StatelessWidget {
  const CustomProgressIndicatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 100,
        constraints: BoxConstraints.expand(),
        child: FittedBox(
          fit: BoxFit.none,
          child: SizedBox(
            height: 100,
            width: 100,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: CircularProgressIndicator(),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ),
        decoration: BoxDecoration(
            color: Color.fromARGB(100, 105, 105, 105)),
      ),
    );
  }
}

Widget customProgressIndicator() {
  return Center(
    child: Container(
      // height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 5)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: CircularProgressIndicator(
          color: Colors.yellow.shade700,
        ),
      ),
    ),
  );
}
