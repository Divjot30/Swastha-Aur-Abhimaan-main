import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';
import 'package:swastha_aur_swabhimaan/screens/suggestions/bloodPressure/low/lowBloodPressureSuggestion.dart';
import 'package:swastha_aur_swabhimaan/screens/suggestions/bloodPressure/high/highBloodPressureSuggestion.dart';

// ignore: must_be_immutable
class ResultPage extends StatelessWidget {
  bool isMale;
  double age;
  double systolic;
  double diastolic;
  String result;

  ResultPage({
    Key? key,
    required this.age,
    required this.isMale,
    required this.systolic,
    required this.diastolic,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: const CustomAppBar(
          barColor: Color.fromARGB(255, 141, 155, 184),
          tiColor: Colors.black,
          title: 'Blood Pressure Result',
        ),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                width: size.width * 0.7,
                height: size.height * 0.4,
                child: SfRadialGauge(
                  animationDuration: 8000,
                  enableLoadingAnimation: true,
                  axes: <RadialAxis>[
                    RadialAxis(
                      showLastLabel: true,
                      minimum: 0,
                      maximum: 100,
                      ranges: <GaugeRange>[
                        GaugeRange(
                          startValue: 0,
                          endValue: 16,
                          color: Colors.blue,
                        ),
                        GaugeRange(
                          startValue: 16,
                          endValue: 32,
                          color: Colors.green,
                        ),
                        GaugeRange(
                          startValue: 32,
                          endValue: 48,
                          color: Colors.yellow,
                        ),
                        GaugeRange(
                          startValue: 48,
                          endValue: 64,
                          color: Colors.orange,
                        ),
                        GaugeRange(
                          startValue: 64,
                          endValue: 80,
                          color: const Color.fromARGB(255, 255, 104, 4),
                        ),
                        GaugeRange(
                          startValue: 80,
                          endValue: 100,
                          color: Colors.red,
                        ),
                      ],
                      pointers: [
                        NeedlePointer(
                          value: result == 'Low'
                              ? 10
                              : result == 'Normal'
                                  ? 25
                                  : result == 'Pre-Hypertension'
                                      ? 40
                                      : result ==
                                              'High Blood Pressure (Hypertension) Stage 1'
                                          ? 55
                                          : result ==
                                                  'High Blood Pressure (Hypertension) Stage 2'
                                              ? 72
                                              : result == 'Hypertensive Crisis'
                                                  ? 90
                                                  : 0,
                          enableAnimation: true,
                          animationType: AnimationType.ease,
                          animationDuration: 5000,
                        ),
                      ],
                      annotations: [
                        GaugeAnnotation(
                          // ignore: avoid_unnecessary_containers
                          widget: Container(
                            child: Text(
                              result,
                              style: TextStyle(
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lexend',
                                  color: result == 'Low'
                                      ? Colors.blue
                                      : result == 'Normal'
                                          ? Colors.green
                                          : result == 'Pre-Hypertension'
                                              ? Colors.yellow
                                              : result ==
                                                      'High Blood Pressure (Hypertension) Stage 1'
                                                  ? Colors.orange
                                                  : result ==
                                                          'High Blood Pressure (Hypertension) Stage 2'
                                                      ? const Color.fromARGB(
                                                          255, 255, 104, 4)
                                                      : result ==
                                                              'Hypertensive Crisis'
                                                          ? Colors.red
                                                          : Colors.black),
                            ),
                          ),
                          angle: 90,
                          positionFactor: 0.5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                result,
                style: TextStyle(
                    fontFamily: "Lexend",
                    fontSize: size.width * 0.1,
                    fontWeight: FontWeight.bold,
                    color: result == 'Low'
                        ? Colors.blue
                        : result == 'Normal'
                            ? Colors.green
                            : result == 'Pre-Hypertension'
                                ? Colors.yellow
                                : result ==
                                        'High Blood Pressure (Hypertension) Stage 1'
                                    ? Colors.orange
                                    : result ==
                                            'High Blood Pressure (Hypertension) Stage 2'
                                        ? const Color.fromARGB(255, 255, 104, 4)
                                        : result == 'Hypertensive Crisis'
                                            ? Colors.red
                                            : Colors.black),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              TextButton(
                onPressed: () {
                  if (result == 'Low' || result == 'Normal') {
                    nextScreen(context, const LowBloodPressureSuggestion());
                  } else if (result == 'Pre-Hypertension' ||
                      result == 'High Blood Pressure (Hypertension) Stage 1' ||
                      result == 'High Blood Pressure (Hypertension) Stage 2') {
                    nextScreen(context, const HighBloodPressureSuggestion());
                  } else {
                    nextScreen(context, const HighBloodPressureSuggestion());
                  }
                },
                child: Text(
                  'View Suggestions',
                  style: TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: size.width * 0.05,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
