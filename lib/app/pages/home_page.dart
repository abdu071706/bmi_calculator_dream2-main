import 'package:bmi_calculator/app/pages/cubit/bmi_cubit.dart';
import 'package:bmi_calculator/app/pages/cubit/bmi_state.dart';
import 'package:bmi_calculator/app/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/calculate_widget.dart';
import 'widgets/gender_container_widget.dart';
import 'widgets/weight_age_widget.dart';

// const Color activeColor = Colors.blue;
// const Color inactiveColor = Colors.teal;
enum Gender { male, female }

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Color maleColor = inactiveColor;
  // Color femaleColor = inactiveColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff211834),
      appBar: AppBar(
        backgroundColor: Color(0xff211834),
        title: Center(child: Text('Bmi Calcultar')),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GenderContainerWidget(
                      colors: state.maleSelect1!,
                      onTap: () {
                        context.read<HomeCubit>().male();
                      },
                      title: 'Male',
                      icon: Icons.male,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GenderContainerWidget(
                      colors: state.femaleSelect1!,
                      onTap: () {
                        context.read<HomeCubit>().female();
                      },
                      title: 'FeMale',
                      icon: Icons.female,
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(15),
              ),
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            state.heightValue1.toStringAsFixed(0),
                            style: TextStyle(
                              fontSize: 60,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'cm',
                            style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        activeColor: Colors.white,
                        inactiveColor: Colors.grey,
                        max: 220,
                        min: 40,
                        value: state.heightValue1,
                        thumbColor: Colors.red,
                        onChanged: (adanJildirdy) {
                          context.read<HomeCubit>().heightValue(adanJildirdy);
                        },
                      )
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WeightAgeWidget(
                      tag1: '3',
                      tag2: '4',
                      title: 'Weight',
                      middleTitle: state.weight1.toString(),
                      remove: () {
                        context.read<HomeCubit>().minusWeight();
                      },
                      add: () {
                        context.read<HomeCubit>().plusWeight();
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    WeightAgeWidget(
                      tag1: '1',
                      tag2: '2',
                      title: 'age',
                      middleTitle: state.age1.toString(),
                      remove: () {
                        context.read<HomeCubit>().minusAge();
                      },
                      add: () {
                        context.read<HomeCubit>().plusAge();
                      },
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            CalculateWidget(
              text: 'Calculate',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: context.read<HomeCubit>(),
                      child: ResultPage(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
