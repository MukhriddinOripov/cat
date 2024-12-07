part of 'cat_bloc.dart';

@immutable
sealed class CatEvent {}

class GetCatFact extends CatEvent {}

class GetCatFactHistory extends CatEvent {}
