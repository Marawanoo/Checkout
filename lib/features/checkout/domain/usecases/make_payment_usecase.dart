import 'package:checkout_app/features/checkout/data/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:checkout_app/features/checkout/domain/repositories/checkout_repo.dart';

class MakePaymentUseCase {
  final CheckoutRepo repo;

  MakePaymentUseCase({required this.repo});

  Future<void> call(PaymentIntentInputModel inputModel) async {
    return await repo.makePayment(inputModel);
  }
}
