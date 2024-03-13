import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'exercise_model.g.dart';

@HiveType(typeId: 1)
class ExerciseModel extends Equatable{

  ExerciseModel(
    {required this.name,
    required this.type,
    required this.muscle,
    required this.equipment,
    required this.difficulty,
    required this.intructions,});

  @HiveField(0)
  String? name;

  @HiveField(1)
  String? type;

  @HiveField(2)
  String? muscle;

  @HiveField(3)
  String? equipment;

  @HiveField(4)
  String? difficulty;

  @HiveField(5)
  String? intructions;
  
  @override
  // TODO: implement props
  List<Object?> get props => [type,muscle,equipment,difficulty, intructions];


}