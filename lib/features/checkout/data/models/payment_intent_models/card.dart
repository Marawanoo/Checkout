class Card {
  dynamic installments;
  dynamic mandateOptions;
  dynamic network;
  String requestThreeDSecure;

  Card({
    required this.installments,
    required this.mandateOptions,
    required this.network,
    required this.requestThreeDSecure,
  });

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        installments: json["installments"],
        mandateOptions: json["mandate_options"],
        network: json["network"],
        requestThreeDSecure: json["request_three_d_secure"] ?? '',
      );
}
