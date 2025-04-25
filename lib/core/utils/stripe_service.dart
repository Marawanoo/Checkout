import 'package:checkout_app/core/api/api_consumer.dart';
import 'package:checkout_app/core/api/api_key.dart';
import 'package:checkout_app/core/api/dio_consumer.dart';
import 'package:checkout_app/features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';

import 'package:checkout_app/features/checkout/data/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:checkout_app/features/checkout/data/models/payment_intent_models/payment_intent_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiConsumer apiConsumer = DioConsumer(Dio());
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var repo = await apiConsumer.post('payment_intents',
        data: paymentIntentInputModel.toJson(),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        token: '');
    var paymentIntentModel = PaymentIntentModel.fromJson(repo.data);
    return paymentIntentModel;
  }

  Future<void> initPaymentSheet(
      {required String paymentIntentClientSecret,
      required String ephemeralKeySecret}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentClientSecret,
            customerEphemeralKeySecret: ephemeralKeySecret,
            customerId: 'cus_SBpu0H2XmJCfiA',
            merchantDisplayName: 'Open Fashion'));
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var repo = await apiConsumer.post('ephemeral_keys', token: apiKey, data: {
      'customer': customerId
    }, headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Stripe-Version': '2025-03-31.basil'
    });
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(repo.data);
    return ephemeralKeyModel;
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(PaymentIntentInputModel paymentIntentInputModel) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel =
        await createEphemeralKey(customerId: 'cus_SBpu0H2XmJCfiA');
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret,
        ephemeralKeySecret: ephemeralKeyModel.secret!);
    await displayPaymentSheet();
  }
}
