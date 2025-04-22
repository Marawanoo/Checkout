import 'package:equatable/equatable.dart';

import '../../data/models/product_item_model.dart';

class CheckoutState extends Equatable {
  final List<ProductItemModel> products;
  final double totalPrice;

  const CheckoutState({
    this.products = const [],
    this.totalPrice = 0.0,
  });

  CheckoutState copyWith({
    List<ProductItemModel>? products,
    double? totalPrice,
  }) {
    return CheckoutState(
      products: products ?? this.products,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  @override
  List<Object?> get props => [products, totalPrice];
}
