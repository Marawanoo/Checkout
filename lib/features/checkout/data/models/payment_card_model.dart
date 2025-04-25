import 'package:flutter/cupertino.dart';

class PaymentCardModel {
  final String icon;
  final LinearGradient gradient;
  final void Function()? function;

  PaymentCardModel({required this.icon, required this.gradient, this.function});
}
