import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:bmi_calculator/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.interpretation, @required this.result, @required this.text});

  final String result;
  final String text;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 45.0,
            ),
            Expanded(
              child: Text(
                'Your Result',
                style: kBigLableStyle,
              ),
            ),
            Expanded(
              flex: 5,
              child: CustomContainer(
                color: kInactiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      this.text.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      this.result,
                      style: kBMIResultStyle,
                    ),
                    Text(
                      this.interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              lable: 'Recalculate',
              onTap: () {
                Navigator.pushNamed(context, '/input');
              },
            )
          ],
        ),
      ),
    );
  }
}
