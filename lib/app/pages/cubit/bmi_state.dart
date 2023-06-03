import 'package:bmi_calculator/app/pages/home_page.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class HomeState extends Equatable {
  HomeState(
      {this.heightValue1 = 50,
      this.weight1 = 40,
      this.age1 = 12,
      this.maleSelect1,
      this.femaleSelect1});
  double heightValue1;
  int weight1;
  int age1; 

  final Color? maleSelect1;
  final Color? femaleSelect1;

  @override
  List<Object?> get props =>
      [heightValue1, weight1, age1, maleSelect1, femaleSelect1];
  HomeState copyWith({
    double? heightValue,
    int? weight,
    int? age,
    Color? maleSelect,
    Color? femaleSelect,
  }) {
    return HomeState(
        heightValue1: heightValue ?? this.heightValue1,
        weight1: weight ?? this.weight1,
        age1: age ?? this.age1,
        maleSelect1: maleSelect ?? this.maleSelect1,
        femaleSelect1: femaleSelect ?? this.femaleSelect1);
  }
}
