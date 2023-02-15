import 'package:flutter/material.dart';
import '../consts.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.result,
      required this.ismale,
      required this.age});

  final int result;
  final bool ismale;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('BMI RESULT'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.09,
              horizontal: MediaQuery.of(context).size.height * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Your Age',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        '$age',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Column(
                    children: [
                      const Text(
                        'Your Gender',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        ' ${ismale ? 'MALE' : 'FEMALE'}',
                        style: TextStyle(
                          color: ismale ? male : female,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(
                flex: 2,
              ),
              const Text(
                'Your Result',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                '$result',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 100,
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              Text(
                '${18.5 <= result && result <= 25 ? 'Your are normal, keep it that way.' : 'You need to pay more attention to your health.'}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 // var result = weight / pow(height /100 ,2);