import 'package:flutter/material.dart';

class PaymentSuccess extends StatefulWidget {
  final String progressString;

  PaymentSuccess(this.progressString);

  @override
  _PaymentSuccessState createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('${widget.progressString}'),
      ),
    );
  }
}
