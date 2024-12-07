import 'package:cat/data/model/fact_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../core/api_endpoint.dart';

part 'cat_data_remote_source.g.dart';

@RestApi(baseUrl: Endpoint.baseUrl)
abstract class CatDataRemoteSource {
  factory CatDataRemoteSource(Dio dio) = _CatDataRemoteSource;

  @GET(Endpoint.randomFact)
  Future<FactModel> getRandomCatFact({
    @Query('animal_type') String? animalType,
    @Query('amount') int? amount,
  });
}
