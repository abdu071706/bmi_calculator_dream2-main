import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/app/pages/cubit/bmi_state.dart';
import 'package:bmi_calculator/app/pages/home_page.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(maleSelect1: Colors.black, femaleSelect1: Colors.black));

  void heightValue(adanJildirdy){
    emit(state.copyWith(heightValue: adanJildirdy));
  }

  void plusWeight(){
    emit(state.copyWith(weight: state.weight1 + 1));
  }

   void minusWeight(){
    emit(state.copyWith(weight: state.weight1 - 1));
  }

  void  plusAge(){
    emit(state.copyWith(age: state.age1 + 1));
  }

  void  minusAge(){
    emit(state.copyWith(age: state.age1 - 1));
  }

  void male (){
emit(state.copyWith( maleSelect: Colors.teal, femaleSelect: Colors.black));
  }

   void female (){
emit(state.copyWith(femaleSelect: Colors.teal, maleSelect: Colors.black));
  }
}
