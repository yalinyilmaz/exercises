import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/model/exercise_model.dart';
import 'package:flutter_exercise_app/presenter/api.dart';
import 'package:flutter_exercise_app/view/pages/dashboard.dart';
import 'package:flutter_exercise_app/view/pages/my_programs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ***************** Sayafalar arası geçişi sağlayan providerların başlangıcı ******************** //
final homeFragmentMapProvider =
    Provider<Map<HomeFragmentsTypes, Widget>>((ref) {
  return {
    HomeFragmentsTypes.dashboard: const Dashboard(),
    HomeFragmentsTypes.programs: const MyPrograms(),
  };
});

final selectedHomeFragmentWidgetProvider = StateProvider<Widget?>((ref) {
  return ref
      .watch(homeFragmentMapProvider)[ref.watch(selectedHomeFragmentProvider)];
});

final selectedHomeFragmentProvider = StateProvider<HomeFragmentsTypes>((ref) {
  return HomeFragmentsTypes.dashboard;
});

enum HomeFragmentsTypes { dashboard, programs }

// ***************** Sayafalar arası geçişi sağlayan providerların sonu ******************** //

/// Seçilen programın numarasını verir.Her seçimde son program numarasını alır.
/// Burası program isimledirilirse değiştirirlip
/// gerçek bir String program ismi alabilir.
final progNumberProvider = StateProvider<int>((ref) {
  return 0;
});

/// Kişiye göre özelleştirilmiş programların exercise listesini verir.
/// 5 program olucak şekilde tasarlanmıştır.Eğer program sayısı kullanıcıı tarafından değiştirilmesi
/// aşağıdaki provider ı güncellemek yeterli olacaktır.
final myProgListsProvider = StateProvider<List<dynamic>>((ref) {
  return [[], [], [], [], []];
});

///API dan gelen egzersiz listesinin set ediliği providerdır. Doğrudan istek atmaz,
///Proje büyütülmek istenirse bu provider,
/// gelen listeyi filtreyele küçültmek veya başka sayfalarda bastırmak amacıyla kullanılabilir.
final exerciseListProvider = StateProvider<List<ExerciseModel>?>((ref) {
  return;
});

///Bu liste her zaman tek elemanlıdır.Çünkü sadece type ve muscle parametreleri içine gelir.
///Uyguluma büyütülüp fitreler genişlerse diye liste olarak tasarlanmıştır.
final filterNamesProvider = StateProvider<List<String?>>((ref) {
  return [];
});

///API isteğini attığımı par'ametre mapini sağlar.
///bu map sadece name'e type'a ve muscle' a göre istek atılması için parametre verir.
///Daha fazla filtre ve arama yapılması durumunda genişletilebilir.
final parametersProvider = StateProvider<Map<String, String>?>((ref) {
  return {"name": "", "type": "", "muscle": ""};
});

///API isteğini yapan providerdır.Exercise listelerini bu provider döner.
final exercisesFutureProvider =
    FutureProvider<List<ExerciseModel?>?>((ref) async {
  final response = await ref
      .read(exerciseStoreProvider)
      .getExercisesForUser(ref.watch(parametersProvider));

  return response;
});

///ExerciseStore sınıfını provide eder.
final exerciseStoreProvider = Provider((ref) {
  return ExerciseStore(ref);
});

class ExerciseStore {
  final Ref ref;
  ExerciseStore(this.ref);

  ///Tüm exerciseları liste olarak verilen parametreye göre çağırır.
  Future<List<ExerciseModel>> getExercisesForUser(
      Map<String, String>? params) async {
    final response = await ApiClient().getExerciseList(params);

    ref.read(exerciseListProvider.notifier).state = response;

    return response;
  }

  void clearValues(Map<String, String> map) {
    for (var key in map.keys.toList()) {
      map[key] = '';
    }
  }

  void updatesBeforeSubmit(String input) {
    if (ref.read(filterNamesProvider).isNotEmpty) {
      for (var element in ref.read(filterNamesProvider)) {
        ref
            .read(parametersProvider.notifier)
            .state!
            .update(element!, (value) => input);
      }
    } else {
      ref
          .read(parametersProvider.notifier)
          .state!
          .updateAll((key, value) => value = "");
      ref
          .read(parametersProvider.notifier)
          .state!
          .update("name", (value) => input);
    }

    ref.invalidate(exercisesFutureProvider);
  }

  void updateFilters(bool? value,String text){
              if (value == true) {
      if (ref.read(filterNamesProvider).isEmpty) {
        ref.read(filterNamesProvider.notifier).state.add(text);
      }
    } else {
      ref.read(filterNamesProvider.notifier).state.remove(text);
    }
  }
}
