import 'dart:math';

class Calculator {
  Calculator({required this.height, required this.weight});
  int height;
  int weight;
  double? bmi;

  // Constructor

  dynamic bmivalue() {
    bmi = weight / pow(height / 100, 2);
    return bmi!.toStringAsFixed(1);
  }

  dynamic bmiCategory() {
    if (bmi! < 18) {
      return "UnderWeight";
    } else if (bmi! >= 18 && bmi! <= 25) {
      return "Normal";
    } else {
      return "OverWeight";
    }
  }

  dynamic bmiInterpretation() {
    if (bmi! < 18) {
      return "You are so Low on Weight! Plz eat more.";
    } else if (bmi! <= 25 && bmi! >= 18) {
      return "Your Weight is normal. Good Job.";
    } else {
      return "You are so OverWeight! Plz control your mouth.";
    }
  }
}
