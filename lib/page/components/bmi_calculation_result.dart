import 'package:flutter/material.dart';
import 'package:flutter_app_bmi_calculator/controller/bmi_controller.dart';
import 'package:flutter_app_bmi_calculator/theme/color_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class BmiCalculationResult extends StatelessWidget {
  const BmiCalculationResult({
    Key? key,
    required this.bmiController,
  }) : super(key: key);

  final BmiController bmiController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: colorCalculate(bmiController.bmiCalculation()),
          borderRadius: BorderRadius.circular(5)),
      child: Text(
        "BMI : " +
            bmiController.bmiCalculation().toStringAsFixed(2) +
            " " +
            bmiIndex(bmiController.bmiCalculation()),
        style: GoogleFonts.sourceSansPro(fontSize: 18, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }

  Color colorCalculate(double number) {
    if (number > 35) {
      return kSemanticRedColor;
    } else if (35 >= number && number >= 30) {
      return kSemanticOrangeColor;
    } else if (30 > number && number >= 25) {
      return kSemanticYellowColor;
    } else if (25 > number && number >= 18.5) {
      return kSemanticGreenColor;
    } else {
      return kSemanticRedColor;
    }
  }

  String bmiIndex(double number) {
    if (number > 35) {
      return "(Extremly Obese)";
    } else if (35 >= number && number >= 30) {
      return "(Obese)";
    } else if (30 > number && number >= 25) {
      return "(Overweight)";
    } else if (25 > number && number >= 18.5) {
      return "(Normal)";
    } else {
      return "(Underweight)";
    }
  }
}
