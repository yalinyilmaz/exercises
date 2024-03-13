import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/view/helpers/ui_variables.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double borderRadius;
  final Color buttonColor;
  final Color textColor;

  const CustomButton({super.key, 
    required this.text,
    required this.onPressed,
    this.borderRadius = 15.0,
    this.buttonColor = Colors.black,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        //padding: EdgeInsets.symmetric(horizontal: 12),
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Text(text,style: UIGlobalVariables.appTextWhiteBoldLargeStyle,),
      ),
    );
  }
}
