import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/presenter/providers.dart';
import 'package:flutter_exercise_app/view/components/filter_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchInput extends ConsumerStatefulWidget {
  const SearchInput({
    super.key,
    required this.textController,
  });

  final TextEditingController? textController;

  @override
  ConsumerState<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends ConsumerState<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: TextField(
            controller: widget.textController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: ref.watch(filterNamesProvider).isNotEmpty
                  ? "Search ${ref.watch(filterNamesProvider).first}"
                  : "Search name",
              filled: true,
              fillColor: Colors.white,
            ),
            onSubmitted: (input) async {
              ref.read(exerciseStoreProvider).updatesBeforeSubmit(input);
            },
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        const FilterButton()
      ],
    );
  }
}
