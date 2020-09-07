import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.lable, @required this.onTap});

  final Function onTap;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      margin: EdgeInsets.only(top: 10.0),
      width: double.infinity,
      height: 60.0,
      child: RawMaterialButton(
        onPressed: this.onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(this.lable, style: kLableTextStyle),
          ],
        ),
      ),
    );
  }
}
