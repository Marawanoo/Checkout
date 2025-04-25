class Link {
  dynamic persistentToken;

  Link({
    required this.persistentToken,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        persistentToken: json["persistent_token"],
      );
}
