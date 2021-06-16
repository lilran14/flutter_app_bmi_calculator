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
            thumbColor: Colors.white,
            activeTrackHeight: 0.0,
            inactiveTrackHeight: 0.0),
        child: SfSlider(
          thumbShape: _RectThumbShape(),
          showLabels: true,
          value: bmiState.weight,
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

class _RectThumbShape extends SfThumbShape {
  @override
  void paint(PaintingContext context, Offset center,
      {required RenderBox parentBox,
      required RenderBox? child,
      required SfSliderThemeData themeData,
      SfRangeValues? currentValues,
      dynamic currentValue,
      required Paint? paint,
      required Animation<double> enableAnimation,
      required TextDirection textDirection,
      required SfThumb? thumb}) {
    super.paint(context, center,
        parentBox: parentBox,
        child: child,
        themeData: themeData,
        currentValue: currentValue,
        paint: paint,
        enableAnimation: enableAnimation,
        textDirection: textDirection,
        thumb: thumb);

    final Path path = Path();

    path.moveTo(center.dx, center.dy);
    path.lineTo(center.dx + 10, center.dy - 15);
    path.lineTo(center.dx - 10, center.dy - 15);
    path.close();
    context.canvas.drawPath(
        path,
        Paint()
          ..color = themeData.activeTrackColor!
          ..style = PaintingStyle.fill
          ..strokeWidth = 2);
  }
}
