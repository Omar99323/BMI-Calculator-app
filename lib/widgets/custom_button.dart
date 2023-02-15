import 'package:bmi_calculator/consts.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,required this.onpress,
  });
  final void Function() onpress;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: female,
        borderRadius: BorderRadius.circular(15),
      ),
      height: MediaQuery.of(context).size.height / 12,
      width: double.infinity,
      child:  Center(
        child: MaterialButton(
          minWidth: double.infinity,
          height: MediaQuery.of(context).size.height / 13,
          onPressed: onpress,
          child: Text(
            'CALCULATE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: male,
            ),
          ),
        ),
      ),
    );
  }
}
