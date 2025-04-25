import 'metadata.dart';

class AmountDetails {
  Metadata tip;

  AmountDetails({
    required this.tip,
  });

  factory AmountDetails.fromJson(Map<String, dynamic> json) => AmountDetails(
        tip: Metadata.fromJson(json["tip"]),
      );
}
