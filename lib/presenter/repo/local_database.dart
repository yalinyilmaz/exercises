import 'package:hive/hive.dart';

class LocalDBService{

  void saveData(List<dynamic> data) async {
    var box = await Hive.openBox<List<dynamic>>('exercises');
    await box.clear();
    await box.put('data', data);
  }

  Future<List<dynamic>?> loadData() async {
    var box = await Hive.openBox<List<dynamic>>('exercises');
    return box.get('data', defaultValue: [[], [], [], [], [], []]);
  }
}