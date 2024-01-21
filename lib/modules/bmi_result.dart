import 'dart:math';

import 'package:first_app/modules/bmi_calculator.dart';
import 'package:flutter/material.dart';

class InterpretationType {
  final String value;
  final String note;
  final int color;

  InterpretationType(this.value, this.note, this.color);
}

class BMIResultScreen extends StatelessWidget {
  final int weight;
  final double height;
  double result = 0.0;
  InterpretationType interpretation = InterpretationType('', '', 0xFFFFFFFF);

  BMIResultScreen(this.weight, this.height, {super.key}) {
    result = calculate(weight, height);
    interpretation = interpret(result);
  }

  double calculate(int weight, double height) {
    double heightInMeter = height / 100;
    return weight /(heightInMeter * heightInMeter);
  }

  InterpretationType interpret(value) {
    switch (value) {
      case < 18.5:
        return InterpretationType(
            'Underweight',
            'You are underweight. 🍏 Consider consulting with a nutritionist.',
            0xFFfb8500);
      case >= 18.5 && <= 24.9:
        return InterpretationType('Normal Weight',
            'You have a normal body weight. Great job! 🎉', 0xFF16db65);
      case >= 25.0 && <= 29.9:
        return InterpretationType(
            'OverWeight',
            'You are overweight. 💪 Consider adopting a healthier lifestyle.',
            0xFF9b5de5);
      case >= 30.0:
        return InterpretationType(
            'Obesity',
            'You are in the obesity range. Try to focus on a healthier lifestyle. Consult with a healthcare professional. 👨‍⚕️',
            0xFFd62246);
      default:
        return InterpretationType(
            'Unknown', 'BMI calculation result is unknown. 🤷‍♂️', 0xFF8d99ae);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => BMICalculatorScreen(),
                ),
              );
            },
          ),
          title: const Text(
            'BMI RESULT',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF0A0E21),
        ),
        body: Container(
          color: const Color(0xFF0A0E21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 36, horizontal: 20),
                child: Text(
                  'Your Result',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 64, left: 20, right: 20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1F38),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          interpretation.value,
                          style: TextStyle(
                            color: Color(interpretation.color),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              result.toStringAsFixed(1),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 64,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          'Normal BMI range:',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          '18.5 - 24.9 kg/m2',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(interpretation.color),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 24,
                                      horizontal: 24,
                                    ),
                                    child: Text(
                                      interpretation.note,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => BMICalculatorScreen(),
                    ),
                  );
                },
                color: const Color(0xFF2164d9),
                minWidth: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: const Text(
                  'RE-CALCULATE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
