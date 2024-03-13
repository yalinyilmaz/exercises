import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/presenter/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class BottomBar extends ConsumerStatefulWidget {
  const BottomBar({super.key});

  @override
  ConsumerState<BottomBar> createState() => _BottomBarState();
}

int currentIndex = 0;

class _BottomBarState extends ConsumerState<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: ref.watch(selectedHomeFragmentProvider) ==
                HomeFragmentsTypes.dashboard
            ? 0
            : 1,
        selectedItemColor: Colors.black,
        iconSize: 25,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  ref.read(selectedHomeFragmentProvider.notifier).state =
                      HomeFragmentsTypes.dashboard;
                },
                child: const Icon(Icons.home)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  ref.read(selectedHomeFragmentProvider.notifier).state =
                      HomeFragmentsTypes.programs;
                },
                child: const Icon(Icons.menu_rounded)),
            label: 'My Program',
          ),
        ],
        type: BottomNavigationBarType.fixed);
  }
}
