import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/model/exercise_model.dart';
import 'package:flutter_exercise_app/view/pages/home.dart';
import 'package:flutter_exercise_app/view/helpers/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final ProviderContainer container = ProviderContainer();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ExerciseModelAdapter());
  await Hive.openBox<List<dynamic>>("exercises");

  runApp(UncontrolledProviderScope(
      container: container, child: const ExerciseApp()));
}

class ExerciseApp extends StatelessWidget {
  const ExerciseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exercise App',
      theme: Themes.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }

  Future<List<List<ExerciseModel>>> loadData() async {
    var box = await Hive.openBox('exercises');
    return box.get('data', defaultValue: [[], [], [], [], [], []]);
  }
}
