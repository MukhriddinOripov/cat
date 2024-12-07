import 'package:cat/core/utils/hive_service.dart';
import 'package:cat/domain/repositories/cat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/fact_model.dart';

part 'cat_event.dart';

part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  CatRepository catRepository;

  CatBloc(this.catRepository) : super(CatInitial()) {
    on<GetCatFact>(_getCatFact);
    on<GetCatFactHistory>(_getCatFactHistory);
  }

  Future<void> _getCatFact(GetCatFact event, Emitter<CatState> emit) async {
    emit(CatLoading());
    try {
      final fact = await catRepository.fetchCatFact();
      HiveService().addFact(fact);
      emit(CatLoaded(fact));
    } catch (e) {
      print('Error: $e');
      emit(CatError('Failed to fetch cat fact'));
    }
  }

  Future<void> _getCatFactHistory(GetCatFactHistory event, Emitter<CatState> emit) async {
    try {
      final facts = await HiveService().getAllFacts();
      emit(CatFactHistoryLoaded(facts));
    } catch (e) {
      emit(CatError('Failed to fetch cat fact history'));
    }
  }
}
