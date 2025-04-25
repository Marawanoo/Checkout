import 'package:checkout_app/features/checkout/data/models/payment_intent_models/link.dart';

import 'card.dart';

class PaymentMethodOptions {
  Card card;
  Link link;

  PaymentMethodOptions({
    required this.card,
    required this.link,
  });

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) =>
      PaymentMethodOptions(
        card: Card.fromJson(json["card"]),
        link: Link.fromJson(json["link"]),
      );
}
