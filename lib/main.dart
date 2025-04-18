import 'package:flutter/material.dart';
import 'package:my_bmi_calculator2/calculator.dart';
import 'package:my_bmi_calculator2/resultPage.dart';
import 'package:my_bmi_calculator2/theme_changer.dart';
import 'package:my_bmi_calculator2/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

enum Genders { male, female }

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    themeManager.addListener(themeChange);
    super.initState();
  }

  themeChange() {
    if (mounted) {
      setState(() {});
    }
  }

  ThemeManager themeManager = ThemeManager();

  double height = 180;
  int weight = 60;
  int age = 20;
  String strweight = "WEIGHT";
  String strage = "AGE";
  Genders? selectedGender;
  Color inActiveColor = const Color.fromARGB(255, 12, 20, 63);
  Color activeColor = Colors.pink;
  @override
  Widget build(BuildContext context) {
    // Material App
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManager.themeMode,
      // Home Page
      home: Scaffold(
        // backgroundColor: const Color.fromARGB(235, 2, 9, 39),
        appBar: AppBar(
          title: Text('BMI Calculator',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          // backgroundColor: ,
          centerTitle: true,
          actions: [
            Switch(
                value: themeManager.themeMode == ThemeMode.dark,
                onChanged: (newValue) {
                  themeManager.changeTheme(newValue);
                })
          ],
        ),

        // Body
        body: Expanded(
            // Main Column
            child: Column(
          children: [
            // 1st Row
            Expanded(
              child: Row(
                children: [
                  // Male Container
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Genders.male;
                        });
                      },
                      child: Gender(
                        genderName: "Male",
                        genderIcon: Icons.male,
                        rightVal: 3,
                        leftVal: 10,
                        bgColor: selectedGender == Genders.male
                            ? themeManager.themeMode == ThemeMode.light
                                ? const Color.fromRGBO(0, 105, 92, 1)
                                : activeColor
                            : themeManager.themeMode == ThemeMode.light
                                ? Colors.teal
                                : inActiveColor,
                      ),
                    ),
                  ),
                  // Female Container
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Genders.female;
                        });
                      },
                      child: Gender(
                        genderName: "Female",
                        genderIcon: Icons.female,
                        leftVal: 2,
                        rightVal: 10,
                        bgColor: selectedGender == Genders.female
                            ? themeManager.themeMode == ThemeMode.light
                                ? const Color.fromRGBO(0, 105, 92, 1)
                                : activeColor
                            : themeManager.themeMode == ThemeMode.light
                                ? Colors.teal
                                : inActiveColor,
                      ),
                    ),
                  )
                ],
              ),
            ),

            // 2nd Row  HEIGHT
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 12),
                padding: EdgeInsets.only(top: 10, bottom: 12),
                decoration: BoxDecoration(
                  color: themeManager.themeMode == ThemeMode.light
                      ? Colors.teal
                      : const Color.fromARGB(255, 12, 20, 63),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("HEIGHT",
                        style: TextStyle(
                            color: Colors.white60,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold)),
                        Text("cm",
                            style: TextStyle(
                                color: Colors.white60,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    // Slider
                    Slider(
                      value: height,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                      min: 120,
                      max: 220,
                      divisions: 100,
                      inactiveColor: Colors.white60,
                    ),
                  ],
                ),
              ),
            ),
            //3rd Row  WEIGHT, AGE
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WeightAge(
                      bgColor: themeManager.themeMode == ThemeMode.light
                          ? Colors.teal
                          : const Color.fromARGB(255, 12, 20, 63),
                      bgColorIncDec: themeManager.themeMode == ThemeMode.light
                          ? Colors.teal[800]
                          : const Color.fromARGB(123, 20, 32, 99),
                      lmargin: 3,
                      rmargin: 10,
                      title: strweight.toString(),
                      measureType: weight.toString(),
                      onIncrement: () {
                        setState(() {
                          weight++;
                        });
                      },
                      onDecrement: () {
                        setState(() {
                          weight--;
                        });
                      },
                    ),
                    WeightAge(
                        bgColor: themeManager.themeMode == ThemeMode.light
                            ? Colors.teal
                            : const Color.fromARGB(255, 12, 20, 63),
                        bgColorIncDec: themeManager.themeMode == ThemeMode.light
                            ? Colors.teal[800]
                            : const Color.fromARGB(123, 20, 32, 99),
                        lmargin: 10,
                        rmargin: 2,
                        title: strage.toString(),
                        measureType: age.toString(),
                        onIncrement: () {
                          setState(() {
                            age++;
                          });
                        },
                        onDecrement: () {
                          setState(() {
                            age--;
                          });
                        }),
                  ]),
            ),
          ],
        )),
        // Bottom Bar
        bottomNavigationBar: ShowBMIButton(
            height: height.toInt(),
            weight: weight.toInt(),
            bgColor: themeManager.themeMode == ThemeMode.light
                ? Colors.teal
                : Colors.pink),
      ),
    );
  }
}

// Gender Class
class Gender extends StatefulWidget {
  Gender({
    required this.genderName,
    required this.genderIcon,
    required this.leftVal,
    required this.rightVal,
    required this.bgColor,
    Key? key,
  }) : super(key: key);

  final String genderName;
  final IconData genderIcon;
  final double leftVal;
  final double rightVal;
  final Color bgColor;

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
          top: 15,
          bottom: 15,
          right: widget.rightVal,
          left: widget.leftVal,
        ),
        padding: const EdgeInsets.only(top: 10, bottom: 12),
        decoration: BoxDecoration(
          color: widget.bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(widget.genderIcon, color: Colors.white, size: 80),
            Text(widget.genderName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

// Weight and Age Class
class WeightAge extends StatefulWidget {
  WeightAge({
    required this.lmargin,
    required this.rmargin,
    required this.title,
    required this.measureType,
    required this.onIncrement,
    required this.onDecrement,
    required this.bgColor,
    required this.bgColorIncDec,
    Key? key,
  }) : super(key: key);

  Color bgColor;
  Color? bgColorIncDec;
  final double lmargin;
  final double rmargin;
  final String title;
  final String measureType;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  State<WeightAge> createState() => _WeightAgeState();
}

class _WeightAgeState extends State<WeightAge> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
            left: widget.rmargin, right: widget.lmargin, bottom: 15),
        padding: EdgeInsets.only(top: 10, bottom: 12),
        decoration: BoxDecoration(
          color: widget.bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.title,
                style: TextStyle(
                    color: Colors.white60,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            Text(widget.measureType.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Decrement Button
                _buildButton(
                    icon: Icons.remove,
                    onPressed: widget.onDecrement,
                    bgColor: widget.bgColorIncDec!),
                // Space between buttons
                SizedBox(width: 5),
                // Increment Button
                _buildButton(
                    icon: Icons.add,
                    onPressed: widget.onIncrement,
                    bgColor: widget.bgColorIncDec!),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildButton(
    {required IconData icon,
    required VoidCallback onPressed,
    required Color bgColor}) {
  return Container(
      height: 40,
      width: 40,
      margin: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          // color: bgColor,
          ),
      // Decrement Button
      child: FloatingActionButton(
        backgroundColor: bgColor,
        onPressed: onPressed,
        child: Icon(icon, color: Colors.white),
      ));
}

class ShowBMIButton extends StatefulWidget {
  ShowBMIButton({
    required this.height,
    required this.weight,
    required this.bgColor,
  });
  int height;
  int weight;
  Color bgColor;

  @override
  State<ShowBMIButton> createState() => _ShowBMIButtonState();
}

class _ShowBMIButtonState extends State<ShowBMIButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Calculator calculator =
            Calculator(height: widget.height, weight: widget.weight);
        Navigator.of(
          context,
        ).push(MaterialPageRoute(
          builder: (context) => ResultPageClass(
            bmiValue: calculator.bmivalue(),
            bmiCategory: calculator.bmiCategory(),
            bmiInterpretation: calculator.bmiInterpretation(),
          ),
        ));
      },
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.bgColor,
        ),
        child: Center(
          child: Text(
            "CALCULATE YOUR BMI",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
