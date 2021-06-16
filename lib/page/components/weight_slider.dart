import 'package:flutter/material.dart';
import 'package:flutter_app_bmi_calculator/controller/bmi_controller.dart';
import 'package:flutter_app_bmi_calculator/model/bmi_model.dart';
import 'package:flutter_app_bmi_calculator/theme/color_theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class WeightSlider extends StatelessWidget {
  const WeightSlider({
    Key? key,
    required this.bmiState,
    required this.bmiController,
  }) : super(key: key);

  final BmiModel bmiState;
  final BmiController bmiController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: kAccentColor, borderRadius: BorderRadius.circular(5)),
      child: SfSliderTheme(
        data: SfSliderThemeData(
            labelOffset: Offset(0, -10),
            thumbRadius: 15,
            thumbColor: Colors.white,
            activeTrackHeight: 0.0,
            inactiveTrackHeight: 0.0),
        child: SfSlider(
          thumbIcon: Container(
              alignment: Alignment.center,
              child: Text(
                bmiState.weight!.toInt().toString() + "kg",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              )),
          showLabels: true,
          value: bmiState.weight,
          interval: 10,
          max: 100.0,
          min: 0.0,
          onChanged: (value) {
            bmiController.changeWeight(value);
          },
        ),
      ),
    );
  }
}
