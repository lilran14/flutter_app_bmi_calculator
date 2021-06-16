import 'package:flutter/material.dart';
import 'package:flutter_app_bmi_calculator/controller/bmi_controller.dart';
import 'package:flutter_app_bmi_calculator/model/bmi_model.dart';
import 'package:flutter_app_bmi_calculator/page/components/dash_line.dart';
import 'package:flutter_app_bmi_calculator/theme/color_theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class HeightSlider extends StatelessWidget {
  const HeightSlider({
    Key? key,
    required this.heightSliderRatio,
    required this.widthSize,
    required this.bmiState,
    required this.bmiController,
  }) : super(key: key);

  final double heightSliderRatio;
  final double widthSize;
  final BmiModel bmiState;
  final BmiController bmiController;

  String svgSelector(double number) {
    if (number > 35) {
      return "male_person_normal_extreme.svg";
    } else if (35 >= number && number >= 30) {
      return "male_person_normal_obese.svg";
    } else if (30 > number && number >= 25) {
      return "male_person_normal_overweight.svg";
    } else if (25 > number && number >= 21) {
      return "male_person_normal_muscle.svg";
    } else if (21 > number && number >= 18.5) {
      return "male_person_normal.svg";
    } else {
      return "male_person_under_weight.svg";
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: heightSliderRatio,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 25),
                  child: SvgPicture.asset(
                      "assets/images/" +
                          svgSelector(bmiController.bmiCalculation()),
                      height:
                          ((widthSize - 60) / (heightSliderRatio * 100) * 100 -
                                      65) *
                                  bmiState.height! /
                                  190 +
                              20),
                )),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 60,
                height: double.infinity,
                child: SfSliderTheme(
                  data: SfSliderThemeData(
                      thumbColor: kAccentColor,
                      activeTrackColor: kPrimaryColor,
                      inactiveTrackColor: kPrimaryColor),
                  child: SfSlider.vertical(
                    showLabels: true,
                    interval: 10,
                    min: 0.0,
                    max: 190.0,
                    value: bmiState.height,
                    onChanged: (dynamic value) {
                      bmiController.changeHeight(value);
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              top: ((widthSize - 60) / (heightSliderRatio * 100) * 100 - 65) -
                  ((bmiState.height! / 190) *
                      (((widthSize - 60) / (heightSliderRatio * 100) * 100 -
                          65))) +
                  25,
              left: 0,
              child: Container(
                height: 10,
                width: widthSize - 75,
                child: CustomPaint(
                  painter: DashedLinePainter(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
