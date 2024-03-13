import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/model/exercise_model.dart';
import 'package:flutter_exercise_app/presenter/api.dart';
import 'package:flutter_exercise_app/presenter/repo/local_database.dart';
import 'package:flutter_exercise_app/presenter/providers.dart';
import 'package:flutter_exercise_app/view/components/bottom_bar.dart';
import 'package:flutter_exercise_app/view/pages/dashboard.dart';
import 'package:flutter_exercise_app/view/helpers/theme.dart';
import 'package:flutter_exercise_app/view/components/top_header.dart';
import 'package:flutter_exercise_app/view/helpers/ui_variables.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _MainPagesState();
}

class _MainPagesState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
    LocalDBService().loadData().then((loadedData) {
      setState(() {
        ref.read(myProgListsProvider.notifier).state = loadedData!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ref.watch(selectedHomeFragmentWidgetProvider),
        bottomNavigationBar: const BottomBar());
  }
}
