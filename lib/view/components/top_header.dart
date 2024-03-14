import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/main.dart';
import 'package:flutter_exercise_app/presenter/providers.dart';
import 'package:flutter_exercise_app/view/components/filter_bar.dart';
import 'package:flutter_exercise_app/view/components/seacrh_bar.dart';
import 'package:flutter_exercise_app/view/helpers/theme.dart';
import 'package:flutter_exercise_app/view/helpers/ui_variables.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'program_card.dart';
import 'filter_button.dart';

class TopHeader extends SliverPersistentHeaderDelegate {
  const TopHeader({
    this.textController,
    required this.title,
    required this.withSearch,
  });

  final TextEditingController? textController;
  final String title;
  final bool withSearch;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Consumer(builder: (context, ref, c) {
      return Container(
        color: Themes.lightTheme.scaffoldBackgroundColor,
        child: Column(
          children: [
            SizedBox(
              //height: MediaQuery.sizeOf(context).height / 9,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.sizeOf(context).height / 20),
                  Text(title,
                      style: UIGlobalVariables.appTextBlackBoldLargeStyle),
                  SizedBox(height: MediaQuery.sizeOf(context).height / 175),
                  withSearch ? FilterBar() : const SizedBox()
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 13.5,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: withSearch
                      ? SearchInput(textController: textController)
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 9.0, horizontal: 6),
                              child: ProgramChipCard(
                                index: index,
                                toAddExercise: false,
                              ),
                            );
                          },
                        )),
            ),
          ],
        ),
      );
    });
  }

  @override
  double get maxExtent => 170;

  @override
  double get minExtent => 170;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
