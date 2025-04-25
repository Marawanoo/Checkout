class PaypalAmountModel {
  PaypalAmountModel({
    required this.total,
    required this.currency,
    required this.details,
  });

  final String? total;
  final String? currency;
  final Details? details;

  factory PaypalAmountModel.fromJson(Map<String, dynamic> json) {
    return PaypalAmountModel(
      total: json["total"],
      currency: json["currency"],
      details:
          json["details"] == null ? null : Details.fromJson(json["details"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "total": total,
        "currency": currency,
        "details": details?.toJson(),
      };
}

class Details {
  Details({
    required this.subtotal,
    required this.shipping,
    required this.shippingDiscount,
  });

  final String? subtotal;
  final String? shipping;
  final int? shippingDiscount;

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      subtotal: json["subtotal"],
      shipping: json["shipping"],
      shippingDiscount: json["shipping_discount"],
    );
  }

  Map<String, dynamic> toJson() => {
        "subtotal": subtotal,
        "shipping": shipping,
        "shipping_discount": shippingDiscount,
      };
}
