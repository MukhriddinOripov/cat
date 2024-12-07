class FactModel {
  final String id;
  final int v;
  final String text;
  final DateTime updatedAt;
  final bool deleted;
  final String source;
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
