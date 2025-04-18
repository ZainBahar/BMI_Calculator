import 'package:flutter/material.dart';
import 'package:my_bmi_calculator2/theme_changer.dart';

class ResultPageClass extends StatefulWidget {
  ResultPageClass(
      {required this.bmiCategory,
      required this.bmiValue,
      required this.bmiInterpretation});
  dynamic bmiCategory;
  dynamic bmiValue;
  dynamic bmiInterpretation;

  @override
  State<ResultPageClass> createState() => _ResultPageClassState();
}

class _ResultPageClassState extends State<ResultPageClass> {
  ThemeManager themeManager = ThemeManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        centerTitle: true,
        // automaticallyImplyLeading: false,
      ),
      // Main Coloumn of Body
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 5),
            child: Text("Your Result",
                style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.teal[800]
                        : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
          ),
          // Sub-Column of the main Column
          Expanded(
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: 300,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.teal
                      : const Color.fromARGB(255, 12, 20, 63),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.bmiCategory,
                        style: TextStyle(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.white
                                  : Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(widget.bmiValue.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 90,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      "Normal BMI range:",
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "18 - 25 kg/m2",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      width: 220,
                      margin: const EdgeInsets.only(top: 30, left: 50),
                      child: Text(widget.bmiInterpretation,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          )),
                    ),
                    Container(
                        margin: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.teal[700]
                                    : const Color.fromARGB(255, 11, 15, 37)),
                        width: 180,
                        height: 50,
                        child: Center(
                          child: Text("SAVE RESULT",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              )),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
            height: 60,
            width: double.infinity,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.teal
                : Colors.pink,
            child: Center(
              child: Text("RE-CALCULATE YOUR BMI",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            )),
      ),
    );
  }
}
