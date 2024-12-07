part of 'cat_bloc.dart';

@immutable
sealed class CatState {}

final class CatInitial extends CatState {}

final class CatLoading extends CatState {}

final class CatLoaded extends CatState {
  final FactModel fact;

  CatLoaded(this.fact);
}

final class CatFactHistoryLoaded extends CatState {
  final List<FactModel> facts;

  CatFactHistoryLoaded(this.facts);
}

final class CatError extends CatState {
  final String message;

  CatError(this.message);
}
