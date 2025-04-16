import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResultPageClass extends StatefulWidget {
  const ResultPageClass({super.key});

  @override
  State<ResultPageClass> createState() => _ResultPageClassState();
}

class _ResultPageClassState extends State<ResultPageClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(235, 2, 9, 39),
      appBar: AppBar(
        title: Text("Result",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        backgroundColor: const Color.fromARGB(255, 2, 6, 27),
        centerTitle: true,
        // automaticallyImplyLeading: false,
      ),
      // Main Coloumn of Body
      body: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Your Result",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
            // Sub-Column of the main Column
            Expanded(
              child: Center(
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 12, 20, 63),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("NORMAL",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("22.1",
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
                        "18,5 - 25 kg/m2",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        width: 220,
                        margin: const EdgeInsets.only(top: 30, left: 50),
                        child: Text("You have a normal body weight. Good job!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            )),
                      ),
                      Container(
                          margin: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 11, 15, 37)),
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
      ),
      bottomNavigationBar: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.pink),
          child: Center(
            child: Text("RE-CALCULATE YOU BMI",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          )),
    );
  }
}
