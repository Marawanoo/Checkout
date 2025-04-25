import 'package:checkout_app/core/api/api_key.dart';
import 'package:checkout_app/core/utils/stripe_service.dart';
import 'package:checkout_app/features/checkout/data/datasources/stripe_remote_data_source.dart';
import 'package:checkout_app/features/checkout/data/repositories/checkout_repo_impl.dart';
import 'package:checkout_app/features/checkout/domain/usecases/make_payment_usecase.dart';
import 'package:checkout_app/features/checkout/presentation/bloc/checkout_bloc.dart';
import 'package:checkout_app/features/checkout/presentation/views/add_new_card_view.dart';
import 'package:checkout_app/features/checkout/presentation/views/checkout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() {
  Stripe.publishableKey = publishableKey;
  runApp(const CheckOutApp());
}

class CheckOutApp extends StatelessWidget {
  const CheckOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 797),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider<CheckoutBloc>(
            create: (context) => CheckoutBloc(
                  makePaymentUseCase: MakePaymentUseCase(
                    repo: CheckoutRepoImpl(
                      remoteDataSource: StripeRemoteDataSourceImpl(
                        stripeService: StripeService(),
                      ),
                    ),
                  ),
                ),
            child: MaterialApp(
              routes: {
                'addNewCard': (context) => const AddNewCardView(),
                'checkout': (context) => CheckoutView()
              },
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: AppBarTheme(backgroundColor: Colors.white)),
              home: child,
            ));
      },
      child: CheckoutView(),
    );
  }
}
