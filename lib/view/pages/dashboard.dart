import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/presenter/providers.dart';
import 'package:flutter_exercise_app/view/components/exercise_card.dart';
import 'package:flutter_exercise_app/view/helpers/theme.dart';
import 'package:flutter_exercise_app/view/components/top_header.dart';
import 'package:flutter_exercise_app/view/helpers/ui_variables.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({
    super.key,
  });

  @override
  ConsumerState<Dashboard> createState() => _HomePageState();
}

late TextEditingController textController;

class _HomePageState extends ConsumerState<Dashboard> {
  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverPersistentHeader(
        floating: true,
        pinned: true,
        delegate: TopHeader(
            textController: textController, title: "Home", withSearch: true),
      ),
      ref.watch(exercisesFutureProvider).when(
            data: (exerciseList) {
              return exerciseList!.isNotEmpty
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return ExerciseCard(
                              withAddBtn: true, exercise: exerciseList[index]);
                        },
                        childCount: exerciseList.length,
                      ),
                    )
                  : SliverToBoxAdapter(
                      child: SizedBox(
                          height: MediaQuery.sizeOf(context).height / 1.5,
                          child: Center(
                              child: Text("No Results Found",
                                  style: UIGlobalVariables
                                      .appTextBlackRegularLargeStyle))),
                    );
            },
            loading: () =>
                const SliverToBoxAdapter(child: CompLoadingAnimation()),
            error: (Object error, StackTrace stackTrace) => SliverToBoxAdapter(
                child: SizedBox(
                    height: MediaQuery.sizeOf(context).height / 1.5,
                    child: Center(
                        child: Text(
                      "Failed to connect to the server",
                      style: UIGlobalVariables.appTextBlackRegularLargeStyle,
                    )))),
          )
    ]);
  }
}

class CompLoadingAnimation extends StatelessWidget {
  const CompLoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(.5),
        radius: 25,
        child: const Padding(
          padding: EdgeInsets.all(0.0),
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          ),
        ),
      ),
    );
  }
}
