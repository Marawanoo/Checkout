import 'package:checkout_app/features/checkout/data/models/payment_intent_input_model/payment_intent_input_model.dart';

import '../../../../core/utils/stripe_service.dart';

abstract class StripeRemoteDataSource {
  Future<void> makePayment(PaymentIntentInputModel inputModel);
}

class StripeRemoteDataSourceImpl implements StripeRemoteDataSource {
  final StripeService stripeService;

  StripeRemoteDataSourceImpl({required this.stripeService});

  @override
  Future<void> makePayment(PaymentIntentInputModel inputModel) async {
    await stripeService.makePayment(inputModel);
  }
}
