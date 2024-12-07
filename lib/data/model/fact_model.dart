import 'package:hive/hive.dart';

part 'fact_model.g.dart';

@HiveType(typeId: 0)
class FactModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final int v;

  @HiveField(2)
  final String text;

  @HiveField(3)
  final DateTime updatedAt;

  @HiveField(4)
  final bool deleted;

  @HiveField(5)
  final String source;

  @HiveField(6)
  final int sentCount;

  FactModel({
    required this.id,
    required this.v,
    required this.text,
    required this.updatedAt,
    required this.deleted,
    required this.source,
    required this.sentCount,
  });

  factory FactModel.fromJson(Map<String, dynamic> json) => FactModel(
    id: json["_id"],
    v: json["__v"],
    text: json["text"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    deleted: json["deleted"],
    source: json["source"],
    sentCount: json["sentCount"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "__v": v,
    "text": text,
    "updatedAt": updatedAt.toIso8601String(),
    "deleted": deleted,
    "source": source,
    "sentCount": sentCount,
  };
}
