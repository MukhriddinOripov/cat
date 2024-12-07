class UserModel {
  final Name name;
  final Google google;
  final String photo;
  final bool isAdmin;
  final bool deleted;
  final String id;
  final DateTime updatedAt;
  final DateTime createdAt;
  final String email;
  final String ip;
  final int v;
  final String phone;

  UserModel({
    required this.name,
    required this.google,
    required this.photo,
    required this.isAdmin,
    required this.deleted,
    required this.id,
    required this.updatedAt,
    required this.createdAt,
    required this.email,
    required this.ip,
    required this.v,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: Name.fromJson(json["name"]),
        google: Google.fromJson(json["google"]),
        photo: json["photo"],
        isAdmin: json["isAdmin"],
        deleted: json["deleted"],
        id: json["_id"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        email: json["email"],
        ip: json["ip"],
        v: json["__v"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "google": google.toJson(),
        "photo": photo,
        "isAdmin": isAdmin,
        "deleted": deleted,
        "_id": id,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "email": email,
        "ip": ip,
        "__v": v,
        "phone": phone,
      };
}

class Google {
  final String id;
  final String accessToken;
  final String refreshToken;

  Google({
    required this.id,
    required this.accessToken,
    required this.refreshToken,
  });

  factory Google.fromJson(Map<String, dynamic> json) => Google(
        id: json["id"],
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}

class Name {
  final String first;
  final String last;

  Name({
    required this.first,
    required this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        first: json["first"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
      };
}
