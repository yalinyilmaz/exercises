import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exercise_app/model/exercise_model.dart';
import 'package:flutter_exercise_app/view/helpers/message_dialog.dart';
import 'package:flutter_exercise_app/view/helpers/theme.dart';
import 'package:flutter_exercise_app/view/components/top_header.dart';
import 'package:flutter_exercise_app/view/helpers/ui_variables.dart';

import 'program_card.dart';
import 'custom_button.dart';

class ExerciseCard extends StatefulWidget {
  const ExerciseCard({super.key, required this.withAddBtn, this.exercise});

  final bool withAddBtn;
  final ExerciseModel? exercise;

  @override
  State<ExerciseCard> createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.5),
      child: Container(
          padding: const EdgeInsets.all(12),
          height: MediaQuery.sizeOf(context).height / 6.0,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.exercise?.name ?? "",
                      style: UIGlobalVariables.appTextBlackRegularMediumStyle),
                  widget.withAddBtn
                      ? GestureDetector(
                          onTap: () async {
                            HapticFeedback.heavyImpact();
                            return await MessageDialog(
                              context: context,
                              height: MediaQuery.sizeOf(context).height / 1.8,
                              content: ProgramsListing(widget: widget),
                            ).withSingleButton();
                          },
                          child: const Icon(Icons.add_rounded))
                      : const SizedBox()
                ],
              ),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                    color: Themes.lightTheme.scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.all(Radius.circular(40))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Text(widget.exercise?.type ?? "",
                      style: UIGlobalVariables.appTextBlackRegularSmallStyle),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height/48),
              Text(widget.exercise?.muscle ?? "",
                  style: UIGlobalVariables.appTextBlackRegularMediumStyle)
            ],
          )),
    );
  }

}

class ProgramsListing extends StatelessWidget {
  const ProgramsListing({
    super.key,
    required this.widget,
  });

  final ExerciseCard widget;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Choose Your Program!",
              style: UIGlobalVariables
                  .appTextBlackBoldVeryLargeStyle),
          const SizedBox(height: 32),
          ProgramChipCard(
              index: 0,
              toAddExercise: true,
              exercise: widget.exercise),
          const SizedBox(height: 12),
          ProgramChipCard(
              index: 1,
              toAddExercise: true,
              exercise: widget.exercise),
          const SizedBox(height: 12),
          ProgramChipCard(
              index: 2,
              toAddExercise: true,
              exercise: widget.exercise),
          const SizedBox(height: 12),
          ProgramChipCard(
              index: 3,
              toAddExercise: true,
              exercise: widget.exercise),
          const SizedBox(height: 12),
          ProgramChipCard(
              index: 4,
              toAddExercise: true,
              exercise: widget.exercise),
          const SizedBox(height: 20),
          CustomButton(
            text: "Back",
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
