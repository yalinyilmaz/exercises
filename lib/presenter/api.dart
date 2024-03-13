import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_exercise_app/model/exercise_model.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static var baseUrl =
      Uri.parse('https://exercises-by-api-ninjas.p.rapidapi.com/v1/exercises');
  static var headers = {
    'X-RapidAPI-Key': 'dff3784dd0msh819894b90442456p14c145jsn6b5c54dccec7',
    'X-RapidAPI-Host': 'exercises-by-api-ninjas.p.rapidapi.com'
  };

  Future<List<ExerciseModel>> getExerciseList(
      Map<String, String>? params) async {
    var response = await http.get(baseUrl.replace(queryParameters: params),
        headers: headers);

    final exerciseList = (jsonDecode(response.body)) as List;

    List<ExerciseModel> exercises = List.generate(
        exerciseList.length,
        (index) => ExerciseModel(
            name: exerciseList[index]["name"],
            type: exerciseList[index]["type"],
            muscle: exerciseList[index]["muscle"],
            equipment: exerciseList[index]["equipment"],
            difficulty: exerciseList[index]["difficulty"],
            intructions: exerciseList[index]["instructions"]));
    log(exercises.toString());

    return exercises;
  }
}
