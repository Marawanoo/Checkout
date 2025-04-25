class AutomaticPaymentMethods {
  bool enabled;

  AutomaticPaymentMethods({
    required this.enabled,
  });

  factory AutomaticPaymentMethods.fromJson(Map<String, dynamic> json) =>
      AutomaticPaymentMethods(
        enabled: json["enabled"],
      );
}
