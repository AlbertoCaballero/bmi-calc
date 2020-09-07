import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import 'round_icon_button.dart';

class NumberSelector extends StatelessWidget {

  NumberSelector({@required this.lable, @required this.value, @required this.onPressedPlus, @required this.onPressedMinus});

  final String lable;
  final String value;
  final Function onPressedPlus;
  final Function onPressedMinus;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          this.lable,
          style: kLableTextStyle,
        ),
        Text(
          this.value,
          style: kBigLableStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: this.onPressedMinus,
            ),
            SizedBox(
              width: 10.0,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: this.onPressedPlus,
            ),
          ],
        ),
      ],
    );
  }
}
