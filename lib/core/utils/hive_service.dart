import 'package:cat/data/model/fact_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  final String _boxName = "factBox";

  Future<Box<FactModel>> get _box async => await Hive.openBox<FactModel>(_boxName);

//create
  Future<void> addFact(FactModel fact) async {
    var box = await _box;
    await box.add(fact);
  }

//read
  Future<List<FactModel>> getAllFacts() async {
    var box = await _box;
    return box.values.toList();
  }

//update
  Future<void> updateFact(int index, FactModel fact) async {
    var box = await _box;
    await box.putAt(index, fact);
  }

//delete
  Future<void> deleteFact(int index) async {
    var box = await _box;
    await box.deleteAt(index);
  }
}
