class AssociatedObject {
  AssociatedObject({
    required this.id,
    required this.type,
  });

  final String? id;
  final String? type;

  factory AssociatedObject.fromJson(Map<String, dynamic> json) {
    return AssociatedObject(
      id: json["id"] ?? '',
      type: json["type"] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
      };
}
