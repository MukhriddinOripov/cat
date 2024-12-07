import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../data/data_remote_source/cat_data_remote_source.dart';
import '../../domain/repositories/cat_repository.dart';
import '../../presentation/bloc/cat_bloc.dart';
import 'hive_service.dart';

class InjectionContainer {
  final getIt = GetIt.instance;

  static final _instance = InjectionContainer._();

  static InjectionContainer get instance => _instance;

  InjectionContainer._();

  Future<void> initDependencies() async {
    final dio = Dio();
    await Hive.initFlutter();

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    getIt.registerSingleton<Dio>(dio);
    getIt.registerSingleton<HiveService>(HiveService());
    getIt.registerFactory(() => CatDataRemoteSource(getIt<Dio>()));
    getIt.registerFactory(() => CatRepository(getIt<CatDataRemoteSource>()));
    getIt.registerFactory(() => CatBloc(getIt<CatRepository>()));
  }
}
