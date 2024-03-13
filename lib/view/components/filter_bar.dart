import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/presenter/providers.dart';
import 'package:flutter_exercise_app/view/helpers/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterBar extends StatefulWidget {
  const FilterBar({
    super.key,
  });

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final parameters = ref.watch(parametersProvider);
      final filters = ref.watch(filterNamesProvider);

      return filters.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Container(
                height: MediaQuery.sizeOf(context).height / 35,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(18))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Text(
                        "Name: ${parameters!["name"]!.isEmpty ? "any" : parameters["name"]} / Type: ${parameters["type"]!.isEmpty ? "any" : parameters["type"]} / Muscle: ${parameters["muscle"]!.isEmpty ? "any" : parameters["muscle"]}"),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          ref.read(filterNamesProvider.notifier).state.clear();
                          ref.read(exerciseStoreProvider).clearValues(parameters);
                          ref.invalidate(exercisesFutureProvider);
                        });
                      },
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor:
                            Themes.lightTheme.scaffoldBackgroundColor,
                        child: const Icon(
                          Icons.close,
                          size: 15,
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            )
          : const SizedBox();
    });
  }
}
