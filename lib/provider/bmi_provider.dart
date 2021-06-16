import 'package:flutter_app_bmi_calculator/controller/bmi_controller.dart';
import 'package:flutter_app_bmi_calculator/model/bmi_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bmiProvider = StateNotifierProvider.autoDispose<BmiController, BmiModel>(
    (ref) => BmiController());
