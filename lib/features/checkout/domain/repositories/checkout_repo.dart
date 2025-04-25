import '../../data/models/payment_intent_input_model/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<void> makePayment(PaymentIntentInputModel inputModel);
}
