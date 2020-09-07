import 'package:bmi_calculator/pages/result_page.dart';
import 'package:bmi_calculator/widgets/large_slider.dart';
import 'package:bmi_calculator/widgets/number_selector.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/custom_container.dart';
import '../widgets/gender_insert.dart';
import '../widgets/bottom_button.dart';
import '../services/calculator.dart';
import '../constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  int height = 180;
  int weight = 85;
  int age = 25;

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
                        color: maleCardColor,
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
                        color: femaleCardColor,
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
                color: kInactiveCardColor,
                child: LargeSlider(
                  lable: 'Height',
                  value: height,
                  min: 120,
                  max: 220,
                  units: ' cm',
                  onChanged: (double newHeight) {
                    setState(() {
                      height = newHeight.toInt();
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomContainer(
                      color: kInactiveCardColor,
                      child: NumberSelector(
                        lable: 'Weight',
                        value: weight.toString(),
                        onPressedMinus: () {
                          setState(() {
                            weight--;
                          });
                        },
                        onPressedPlus: () {
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomContainer(
                      color: kInactiveCardColor,
                      child: NumberSelector(
                        lable: 'Age',
                        value: age.toString(),
                        onPressedMinus: () {
                          setState(() {
                            age--;
                          });
                        },
                        onPressedPlus: () {
                          setState(() {
                            age++;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              lable: 'Calculate BMI',
              onTap: () {
                Calculator calc = Calculator(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      result: calc.calculateBMI(),
                      text: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
