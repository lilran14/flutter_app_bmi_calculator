enum Gender { male, female }

class BmiModel {
  final double? height, weight;
  final Gender? gender;

  BmiModel({this.height = 190, this.weight = 80, this.gender = Gender.male});
}
