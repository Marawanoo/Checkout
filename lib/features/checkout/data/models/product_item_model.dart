class ProductItemModel {
  final String id;
  final String imagePath;
  final String title;
  final String subtitle;
  final double price;
  final int quantity;

  ProductItemModel({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.quantity,
  });

  ProductItemModel copyWith({
    String? id,
    String? imagePath,
    String? title,
    String? subtitle,
    double? price,
    int? quantity,
  }) {
    return ProductItemModel(
      id: id ?? this.id,
      imagePath: imagePath ?? this.imagePath,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }
}
