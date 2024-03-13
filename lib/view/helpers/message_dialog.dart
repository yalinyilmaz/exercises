import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/model/exercise_model.dart';
import 'package:flutter_exercise_app/view/components/program_card.dart';
import 'package:flutter_exercise_app/view/components/custom_button.dart';
import 'package:flutter_exercise_app/view/helpers/theme.dart';
import 'package:flutter_exercise_app/view/helpers/ui_variables.dart';


class MessageDialog {
  MessageDialog(
      {required this.context,
      required this.content,
      required this.height,
      this.exercise});
  BuildContext context;
  ExerciseModel? exercise;
  double height;
  Widget content;

  Future<void> withSingleButton() {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              contentPadding: const EdgeInsets.all(12),
              insetPadding: const EdgeInsets.all(8),
              content: Container(
                height: height,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Themes.lightTheme.scaffoldBackgroundColor,
                ),
                child: content,
              ),
            ));
  }
}
