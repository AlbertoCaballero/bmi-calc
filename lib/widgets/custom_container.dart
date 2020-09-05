import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({@required this.color, this.child});

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.child,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: this.color, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}