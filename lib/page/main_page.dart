import 'package:flutter/material.dart';
import 'package:flutter_app_bmi_calculator/controller/bmi_controller.dart';
import 'package:flutter_app_bmi_calculator/model/bmi_model.dart';
import 'package:flutter_app_bmi_calculator/page/components/bmi_calculation_result.dart';
import 'package:flutter_app_bmi_calculator/page/components/height_slider.dart';
import 'package:flutter_app_bmi_calculator/page/components/weight_slider.dart';
import 'package:flutter_app_bmi_calculator/provider/bmi_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    BmiModel bmiState = watch(bmiProvider);
    BmiController bmiController = watch(bmiProvider.notifier);
    double widthSize = MediaQuery.of(context).size.width;
    double heightSliderRatio = 0.83;

    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Container(
        width: widthSize,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // GenderSelect(
            //   bmiController: bmiController,
            // ),
            HeightSlider(
                heightSliderRatio: heightSliderRatio,
                widthSize: widthSize,
                bmiState: bmiState,
                bmiController: bmiController),
            WeightSlider(bmiState: bmiState, bmiController: bmiController),
            BmiCalculationResult(bmiController: bmiController),
            Spacer(),
            Text(
              "Made with 🖤 by LilRan14",
              style: GoogleFonts.sourceSansPro(fontSize: 14),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
