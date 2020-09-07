import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class LargeSlider extends StatelessWidget {
  LargeSlider(
      {@required this.lable,
      @required this.units,
      @required this.value,
      @required this.min,
      @required this.max,
      @required this.onChanged
      });

  final String lable;
  final String units;
  final int value;
  final int min, max;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            this.lable,
            style: kLableTextStyle,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              value.toString(),
              style: kBigLableStyle,
            ),
            Text(
              this.units,
              style: kBigLableStyle,
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
          ),
          child: Slider(
            value: this.value.toDouble(),
            min: this.min.toDouble(),
            max: this.max.toDouble(),
            activeColor: Colors.cyan,
            onChanged: this.onChanged,
          ),
        ),
      ],
    );
  }
}
