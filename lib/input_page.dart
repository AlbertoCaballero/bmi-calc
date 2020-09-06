import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'widgets/custom_container.dart';
import 'widgets/gender_insert.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  int height = 180;

  void updateColor(Gender gender) {
    maleCardColor =
        gender == Gender.male ? kActiveCardColor : kInactiveCardColor;
    femaleCardColor =
        gender == Gender.female ? kActiveCardColor : kInactiveCardColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(Gender.male);
                        });
                      },
                      child: CustomContainer(
                        color: Color(maleCardColor.value),
                        child: GenderInsert(
                          icon: FontAwesomeIcons.mars,
                          gender: 'Male',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(Gender.female);
                        });
                      },
                      child: CustomContainer(
                        color: Color(femaleCardColor.value),
                        child: GenderInsert(
                          icon: FontAwesomeIcons.venus,
                          gender: 'Female',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomContainer(
                color: Color(kInactiveCardColor.value),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Height',
                        style: kLableTextStyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kBigLableStyle,
                        ),
                        Text(
                          ' cm',
                          style: kBigLableStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 10.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: Colors.cyan,
                        onChanged: (double newHeight) {
                          setState(() {
                            height = newHeight.toInt();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomContainer(
                      color: Color(kInactiveCardColor.value),
                      child: GenderInsert(
                        icon: Icons.widgets,
                        gender: 'Widgets',
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomContainer(
                      color: Color(kInactiveCardColor.value),
                      child: GenderInsert(
                        icon: Icons.weekend,
                        gender: 'Weekend',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                print('Calculated');
              },
              child: Container(
                color: Colors.cyan,
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 60.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Calculate BMI'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
