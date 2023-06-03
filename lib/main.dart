import 'package:bmi_calculator/app/pages/cubit/bmi_cubit.dart';
import 'package:bmi_calculator/app/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/pages/home_page.dart';

void main() {
  runApp(BmiCalculator());
}

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => HomeCubit(),
        child: HomePage(),
      ),
      // home: ResulPage(),
    );
  }
}
