import 'dart:math';

import 'package:flutter/cupertino.dart';

class Calculator {
  Calculator({@required this.height, @required this.weight});

  final int height;
  final int weight;

  double _bmi;

  String get bmi {
    _bmi = this.weight / pow(this.height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String get result {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String get interpretation {
    if (_bmi >= 25) {
      return 'Maybe some more exercice and vegies!';
    } else if (_bmi > 18.5) {
      return 'Pretty good body, keep it up!';
    } else {
      return 'Hey some more food (and secret candy)!';
    }
  }
}
