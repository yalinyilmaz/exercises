import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exercise_app/model/exercise_model.dart';
import 'package:flutter_exercise_app/presenter/repo/local_database.dart';
import 'package:flutter_exercise_app/presenter/providers.dart';
import 'package:flutter_exercise_app/view/components/custom_button.dart';
import 'package:flutter_exercise_app/view/helpers/message_dialog.dart';
import 'package:flutter_exercise_app/view/helpers/ui_variables.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

// ignore: must_be_immutable
class ProgramChipCard extends ConsumerStatefulWidget {
  ProgramChipCard(
      {required this.index,
      required this.toAddExercise,
      this.exercise,
      super.key});

  int index;
  bool toAddExercise;
  ExerciseModel? exercise;

  @override
  ConsumerState<ProgramChipCard> createState() => _ProgramChipCardState();
}

class _ProgramChipCardState extends ConsumerState<ProgramChipCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        HapticFeedback.selectionClick();
        if (widget.toAddExercise) {
          if (!ref
              .read(myProgListsProvider)[widget.index]!
              .contains(widget.exercise)) {
            ref
                .read(myProgListsProvider.notifier)
                .state[widget.index]!
                .add(widget.exercise!);
            print(ref.read(myProgListsProvider).toString());

            LocalDBService()
                .saveData(ref.read(myProgListsProvider.notifier).state);
            await MessageDialog(
                    context: context,
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.check_box_rounded,size:95,color: Colors.blueGrey),
                          Text(
                            "Exercise successfully added to The Program ${widget.index + 1}",
                            style: UIGlobalVariables.appTextBlackBoldLargeStyle,
                            textAlign: TextAlign.center,
                          ),
                          CustomButton(
                            text: "Ok",
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ),
                    height: MediaQuery.sizeOf(context).height / 2.4)
                .withSingleButton();
          }else{
            MessageDialog(
                    context: context,
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.warning_rounded,size:95,color: Colors.blueGrey),
                          Text(
                            "This exercise already exists in The Program ${widget.index + 1}",
                            style: UIGlobalVariables.appTextBlackBoldLargeStyle,
                            textAlign: TextAlign.center,
                          ),
                          CustomButton(
                            text: "Ok",
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ),
                    height: MediaQuery.sizeOf(context).height / 2.4)
                .withSingleButton();
          }
        } else {
          ref.read(progNumberProvider.notifier).state = widget.index;
        }
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width / 3.6,
        height: MediaQuery.sizeOf(context).height / 17,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: widget.index == ref.watch(progNumberProvider) &&
                    !widget.toAddExercise
                ? Colors.blueGrey
                : Colors.white),
        child: Center(child: Text("Program ${widget.index + 1}")),
      ),
    );
  }
}
