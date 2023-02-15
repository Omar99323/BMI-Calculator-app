import 'package:flutter/material.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/Screens/result_page.dart';
import '../consts.dart';
import '../widgets/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int height = 100;
  int weight = 70;
  int age = 20;
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return mainColor;
      }
      return female;
    }

    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
              child: Column(
                children: [
                  //gender bloc
                  Expanded(
                    flex: 3,
                    child: genderRow(context),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  //height block
                  Expanded(
                    flex: 4,
                    child: sliderBlock(context, getColor),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  // weight and age blocks
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        Expanded(
                          child: weightBlock(context),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Expanded(
                          child: ageBlock(context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomButton(
            onpress: () {
              buttonOnpress(context);
            },
          ),
        ],
      ),
    );
  }

  void buttonOnpress(BuildContext context) {
    double result = weight / pow(height / 100, 2);
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            result: result.round(),
            age: age,
            ismale: isMale,
          ),
        ),
      );
    });
  }

  Container ageBlock(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'AGE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white54,
              fontSize: 20,
            ),
          ),
          Text(
            age.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 60,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: 'age minus',
                backgroundColor: female,
                onPressed: () {
                  setState(() {
                    --age;
                  });
                },
                child: const Icon(
                  Icons.remove,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.04,
              ),
              FloatingActionButton(
                heroTag: 'age plus',
                backgroundColor: male,
                onPressed: () {
                  setState(() {
                    ++age;
                  });
                },
                child: const Icon(
                  Icons.add,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container weightBlock(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'WEIGHT',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white54,
              fontSize: 20,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                weight.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 60,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              const Text(
                'kg',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: 'weight minus',
                backgroundColor: male,
                onPressed: () {
                  setState(() {
                    --weight;
                  });
                },
                child: const Icon(
                  Icons.remove,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.04,
              ),
              FloatingActionButton(
                heroTag: 'weight plus',
                backgroundColor: female,
                onPressed: () {
                  setState(() {
                    ++weight;
                  });
                },
                child: const Icon(
                  Icons.add,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container sliderBlock(BuildContext context,
      Color Function(Set<MaterialState> states) getColor) {
    return Container(
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'HEIGHT',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white54,
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  height.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                const Text(
                  'cm',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Slider.adaptive(
              thumbColor: female,
              activeColor: male,
              inactiveColor: Colors.cyan[900],
              overlayColor:
                  MaterialStateColor.resolveWith((states) => getColor(states)),
              min: 80,
              max: 250,
              value: height.toDouble(),
              onChanged: (value) {
                setState(() {
                  height = value.round();
                });
              },
            )
          ],
        ),
      ),
    );
  }

  Row genderRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isMale = true;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: backColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      FontAwesomeIcons.mars,
                      color: isMale ? Colors.cyan : Colors.white54,
                      size: 50,
                    ),
                    Text(
                      'MALE',
                      style: TextStyle(
                        color: isMale ? Colors.cyan : Colors.white54,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.02,
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isMale = false;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: backColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      FontAwesomeIcons.venus,
                      color: isMale ? Colors.white54 : Colors.pink,
                      size: 50,
                    ),
                    Text(
                      'FEMALE',
                      style: TextStyle(
                        color: isMale ? Colors.white54 : Colors.pink,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
