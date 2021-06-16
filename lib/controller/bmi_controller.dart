import 'package:flutter_app_bmi_calculator/model/bmi_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BmiController extends StateNotifier<BmiModel> {
  BmiController([BmiModel? initialTodos])
      : super(initialTodos ?? BmiModel(gender: Gender.male));
  void changeGender(Gender gender) {
    state =
        BmiModel(gender: gender, height: state.height, weight: state.weight);
  }

  void changeHeight(double height) {
    state =
        BmiModel(gender: state.gender, height: height, weight: state.weight);
  }

  void changeWeight(double weight) {
    state =
        BmiModel(gender: state.gender, height: state.height, weight: weight);
  }

  double bmiCalculation() {
    return state.weight! / ((state.height! / 100) * (state.height! / 100));
  }
}
