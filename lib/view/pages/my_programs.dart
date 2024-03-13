import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/model/exercise_model.dart';
import 'package:flutter_exercise_app/presenter/repo/local_database.dart';
import 'package:flutter_exercise_app/presenter/providers.dart';
import 'package:flutter_exercise_app/view/components/exercise_card.dart';
import 'package:flutter_exercise_app/view/components/top_header.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPrograms extends ConsumerStatefulWidget {
  const MyPrograms({super.key});

  @override
  ConsumerState<MyPrograms> createState() => _MyProgramsState();
}

class _MyProgramsState extends ConsumerState<MyPrograms> {
  @override
  Widget build(BuildContext context) {
    final programs = ref.watch(myProgListsProvider);
    final progNumber = ref.watch(progNumberProvider);

    return CustomScrollView(slivers: <Widget>[
      const SliverPersistentHeader(
        floating: true,
        pinned: true,
        delegate: TopHeader(title: "My Program", withSearch: false),
      ),
      SliverToBoxAdapter(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: ReorderableListView.builder(
            itemBuilder: (context, index) {
              return Dismissible(
                background: Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.sizeOf(context).width / 2.5),
                  color: Colors.red,
                  child: const Icon(Icons.delete),
                ),
                key: ValueKey<ExerciseModel>(programs[progNumber]![index]),
                onDismissed: (direction) {
                  setState(() {
                    programs[progNumber]!.removeAt(index);
                    LocalDBService().saveData(programs);
                  });
                },
                child: ExerciseCard(
                  key: ValueKey<ExerciseModel>(programs[progNumber]![index]),
                  withAddBtn: false,
                  exercise: programs[progNumber]![index],
                ),
              );
            },
            itemCount: programs[progNumber]!.length,
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final exercise = programs[progNumber]!.removeAt(oldIndex);
                programs[progNumber]!.insert(newIndex, exercise);
                LocalDBService().saveData(programs);
              });
            },
          ),
        ),
      ),
    ]);
  }
}
