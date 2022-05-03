import 'package:flutter/material.dart';
import '../shared/menu_bottom.dart';
import '../shared/menu_drawer.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeidght = TextEditingController();
  final double fontSize = 18;
  String result = "";
  bool isMetric = true;
  bool isImperial = false;
  double? height = 0.0;
  double? weight = 0.0;
  late List<bool> isSelected;
  String heightMessage = "";
  String weightMessage = "";

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMessage =
        "Please enter your height in ${isMetric ? "meters" : "Inches"}";
    weightMessage =
        "Please enter your weight in ${isMetric ? "kilograms" : "Pounds"}";
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculator"),
        ),
        bottomNavigationBar: const MenuBottom(),
        drawer: const MenuDrawer(),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                ToggleButtons(children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child:
                          Text("Metric", style: TextStyle(fontSize: fontSize))),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text("Imperial",
                          style: TextStyle(fontSize: fontSize))),
                ], isSelected: isSelected, onPressed: toggleMeasure),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: TextField(
                    controller: txtHeight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: heightMessage,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: TextField(
                      controller: txtWeidght,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: weightMessage,
                      )),
                ),
                ElevatedButton(
                  child: Text("Calculate BMI",
                      style: TextStyle(fontSize: fontSize)),
                  onPressed: calculateBMI,
                ),
                Text(
                  result,
                  style: TextStyle(
                    fontSize: fontSize,
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void toggleMeasure(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void calculateBMI() {
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeidght.text) ?? 0;
    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }
    setState(() {
      result = "Your BMI is ${bmi.toStringAsFixed(2)}";
    });
  }
}
