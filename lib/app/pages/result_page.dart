import 'package:bmi_calculator/app/data/services/bmi_service.dart';
import 'package:bmi_calculator/app/pages/cubit/bmi_cubit.dart';
import 'package:bmi_calculator/app/pages/cubit/bmi_state.dart';
import 'package:bmi_calculator/app/pages/widgets/calculate_widget.dart';
import 'package:bmi_calculator/constants/colors/app_colors.dart';
import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
  
  });


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.8,
          color: AppColors.mainColor,
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final bmi = BmiService.bmiCalculate(
                weight: state.weight1,
                height: state.heightValue1,
              );
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    BmiService.bmiResult(bmi)!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmi.toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 70,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    BmiService.giveDescription(
                  bmi
                    )!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: CalculateWidget(
        text: 'Re-Calculate',
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
