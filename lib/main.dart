import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_bmi_calculator2/resultPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

enum Genders { male, female }

class _MyAppState extends State<MyApp> {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(235, 2, 9, 39),
        appBar: AppBar(
          title: Text('BMI Calculator',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          backgroundColor: const Color.fromARGB(255, 2, 6, 27),
          centerTitle: true,
        ),
        // Body
        body: Expanded(
            // Main Column
            child: Column(
          children: [
            // 1st Row
            Row(
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
                      rVal: 3,
                      lVal: 10,
                      bgColor: selectedGender == Genders.male
                          ? activeColor
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
                      lVal: 2,
                      rVal: 10,
                      bgColor: selectedGender == Genders.female
                          ? activeColor
                          : inActiveColor,
                    ),
                  ),
                )
              ],
            ),

            // 2nd Row  HEIGHT
            Container(
              height: 178,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 12),
              padding: EdgeInsets.only(top: 10, bottom: 12),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 12, 20, 63),
                borderRadius: BorderRadius.circular(4),
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
                    activeColor: Colors.pink,
                    inactiveColor: Colors.white60,
                  ),
                ],
              ),
            ),
            //3rd Row  WEIGHT, AGE
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WeightAge(
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
            ShowBMIButton(),
          ],
        )),
      ),
    );
  }
}

// Gender Class
class Gender extends StatefulWidget {
  Gender({
    required this.genderName,
    required this.genderIcon,
    required this.lVal,
    required this.rVal,
    required this.bgColor,
    Key? key,
  }) : super(key: key);

  final String genderName;
  final IconData genderIcon;
  final double lVal;
  final double rVal;
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
          right: widget.rVal,
          left: widget.lVal,
        ),
        padding: const EdgeInsets.only(top: 10, bottom: 12),
        decoration: BoxDecoration(
          color: widget.bgColor,
          borderRadius: BorderRadius.circular(3),
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
    Key? key,
  }) : super(key: key);

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
          color: const Color.fromARGB(255, 12, 20, 63),
          borderRadius: BorderRadius.circular(3),
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
                _buildButton(icon: Icons.remove, onPressed: widget.onDecrement),
                // Space between buttons
                SizedBox(width: 5),
                // Increment Button
                _buildButton(icon: Icons.add, onPressed: widget.onIncrement),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildButton({required IconData icon, required VoidCallback onPressed}) {
  return Container(
      height: 40,
      width: 40,
      margin: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color.fromARGB(123, 20, 32, 99),
      ),
      // Decrement Button
      child: FloatingActionButton(
        backgroundColor: const Color.fromARGB(153, 45, 53, 97),
        onPressed: onPressed,
        child: Icon(icon, color: Colors.white),
      ));
}

class ShowBMIButton extends StatefulWidget {
  const ShowBMIButton({super.key});

  @override
  State<ShowBMIButton> createState() => _ShowBMIButtonState();
}

class _ShowBMIButtonState extends State<ShowBMIButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(
          builder: (context) => ResultPageClass(),
        ));
      },
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.pink,
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
