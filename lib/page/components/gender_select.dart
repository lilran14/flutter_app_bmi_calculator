import 'package:flutter/material.dart';
import 'package:flutter_app_bmi_calculator/controller/bmi_controller.dart';
import 'package:flutter_app_bmi_calculator/model/bmi_model.dart';

class GenderSelect extends StatelessWidget {
  const GenderSelect({
    Key? key,
    required this.bmiController,
  }) : super(key: key);
  final BmiController bmiController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
                onPressed: () {
                  bmiController.changeGender(Gender.male);
                },
                child: Text("Male"))),
        SizedBox(
          width: 20,
        ),
        Expanded(
            child: ElevatedButton(
                onPressed: () {
                  bmiController.changeGender(Gender.female);
                },
                child: Text(
                  "Female",
                )))
      ],
    );
  }
}
