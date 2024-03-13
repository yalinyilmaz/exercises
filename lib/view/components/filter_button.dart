import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/presenter/providers.dart';
import 'package:flutter_exercise_app/view/helpers/ui_variables.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterButton extends ConsumerStatefulWidget {
  const FilterButton({
    super.key,
  });

  @override
  ConsumerState<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends ConsumerState<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        child: PopupMenuButton(
          icon: const Icon(
            Icons.filter_list_off_rounded,
            color: Colors.black,
          ),
          itemBuilder: (context) {
            List<Widget> list = [
              FilterCheckbox(text: "type"),
              FilterCheckbox(text: "muscle")
            ];
            return list
                .map((e) => PopupMenuItem(
                      value: e,
                      child: e,
                    ))
                .toList();
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class FilterCheckbox extends ConsumerStatefulWidget {
  FilterCheckbox({super.key, required this.text});

  String text;
 
  @override
  ConsumerState<FilterCheckbox> createState() => _FilterCheckboxState();
}

class _FilterCheckboxState extends ConsumerState<FilterCheckbox> {
  @override
  Widget build(BuildContext context) {

    return CheckboxListTile(
        activeColor: Colors.black,
        value: ref.watch(filterNamesProvider).contains(widget.text),
        onChanged: (value) {
          ref.read(exerciseStoreProvider).updateFilters(value,widget.text);
          setState(() {});
        },
        title: Text(
          widget.text,
          style: UIGlobalVariables.appTextBlackRegularSmallStyle,
        ));
  }
}
