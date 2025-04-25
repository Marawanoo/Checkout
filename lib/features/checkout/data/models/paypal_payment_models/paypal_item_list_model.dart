class PaypalItemListModel {
  PaypalItemListModel({
    required this.items,
  });

  final List<PaypalItem> items;

  factory PaypalItemListModel.fromJson(Map<String, dynamic> json) {
    return PaypalItemListModel(
      items: json["items"] == null
          ? []
          : List<PaypalItem>.from(
              json["items"]!.map((x) => PaypalItem.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "items": items.map((x) => x.toJson()).toList(),
      };
}

class PaypalItem {
  PaypalItem({
    required this.name,
    required this.quantity,
    required this.price,
    required this.currency,
  });

  final String? name;
  final int? quantity;
  final String? price;
  final String? currency;

  factory PaypalItem.fromJson(Map<String, dynamic> json) {
    return PaypalItem(
      name: json["name"],
      quantity: json["quantity"],
      price: json["price"],
      currency: json["currency"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
        "price": price,
        "currency": currency,
      };
}
