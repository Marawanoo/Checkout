import 'associated_object.dart';

class EphemeralKeyModel {
  EphemeralKeyModel({
    required this.id,
    required this.object,
    required this.associatedObjects,
    required this.created,
    required this.expires,
    required this.livemode,
    required this.secret,
  });

  final String? id;
  final String? object;
  final List<AssociatedObject> associatedObjects;
  final int? created;
  final int? expires;
  final bool? livemode;
  final String? secret;

  factory EphemeralKeyModel.fromJson(Map<String, dynamic> json) {
    return EphemeralKeyModel(
      id: json["id"] ?? '',
      object: json["object"] ?? '',
      associatedObjects: json["associated_objects"] == null
          ? []
          : List<AssociatedObject>.from(json["associated_objects"]!
              .map((x) => AssociatedObject.fromJson(x))),
      created: json["created"],
      expires: json["expires"],
      livemode: json["livemode"],
      secret: json["secret"] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "associated_objects": associatedObjects.map((x) => x.toJson()).toList(),
        "created": created,
        "expires": expires,
        "livemode": livemode,
        "secret": secret,
      };
}
