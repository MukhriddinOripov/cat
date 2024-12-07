import 'package:cat/data/model/fact_model.dart';

import '../../data/data_remote_source/cat_data_remote_source.dart';

class CatRepository {
  final CatDataRemoteSource catDataRemoteSource;

  CatRepository(this.catDataRemoteSource);

  Future<FactModel> fetchCatFact({String animalType = 'cat', int amount = 1}) =>
      catDataRemoteSource.getRandomCatFact(animalType: animalType, amount: amount);
}
