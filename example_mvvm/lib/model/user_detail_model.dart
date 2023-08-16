class UserDetail {
  UserDetail({
    required this.id,
    required this.name,
    required this.number,
  });

  final String? id;
  final String? name;
  final String? number;

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      id: json["id"],
      name: json["name"],
      number: json["number"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "number": number,
      };
}
