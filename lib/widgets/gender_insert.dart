import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class GenderInsert extends StatelessWidget {

  GenderInsert({@required this.icon, @required this.gender});

  final IconData icon;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          this.icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          this.gender,
          style: kLableTextStyle,
        ),
      ],
    );
  }
}
