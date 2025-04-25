import 'package:equatable/equatable.dart';

import '../../data/models/payment_intent_input_model/payment_intent_input_model.dart';
import '../../data/models/product_item_model.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class MakePaymentEvent extends CheckoutEvent {
  final PaymentIntentInputModel inputModel;

  const MakePaymentEvent(this.inputModel);

  @override
  List<Object?> get props => [inputModel];
}

class AddProduct extends CheckoutEvent {
  final ProductItemModel product;

  const AddProduct(this.product);

  @override
  List<Object?> get props => [product];
}

class RemoveProduct extends CheckoutEvent {
  final String productId;

  const RemoveProduct(this.productId);

  @override
  List<Object?> get props => [productId];
}

class UpdateQuantity extends CheckoutEvent {
  final String productId;
  final int newQuantity;

  const UpdateQuantity({required this.productId, required this.newQuantity});

  @override
  List<Object?> get props => [productId, newQuantity];
}

class ClearCart extends CheckoutEvent {}
