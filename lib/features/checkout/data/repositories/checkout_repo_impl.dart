import 'package:checkout_app/features/checkout/data/datasources/stripe_remote_data_source.dart';
import 'package:checkout_app/features/checkout/data/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:checkout_app/features/checkout/domain/repositories/checkout_repo.dart';

class CheckoutRepoImpl implements CheckoutRepo {
  final StripeRemoteDataSource remoteDataSource;

  CheckoutRepoImpl({required this.remoteDataSource});

  @override
  Future<void> makePayment(PaymentIntentInputModel inputModel) async {
    await remoteDataSource.makePayment(inputModel);
  }
}
