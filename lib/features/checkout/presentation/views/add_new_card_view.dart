import 'dart:developer';

import 'package:checkout_app/core/api/api_key.dart';
import 'package:checkout_app/features/checkout/data/models/payment_card_model.dart';
import 'package:checkout_app/features/checkout/data/models/paypal_payment_models/paypal_amount_model.dart';
import 'package:checkout_app/features/checkout/data/models/paypal_payment_models/paypal_item_list_model.dart';
import 'package:checkout_app/features/checkout/presentation/bloc/checkout_bloc.dart';
import 'package:checkout_app/features/checkout/presentation/views/payment_success_dialog.dart';
import 'package:checkout_app/features/checkout/presentation/widgets/custom_payment_card.dart';
import 'package:checkout_app/features/checkout/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/payment_intent_input_model/payment_intent_input_model.dart';
import '../bloc/checkout_event.dart';
import '../bloc/checkout_state.dart';
import '../widgets/checkout_app_bar.dart';
import '../widgets/checkout_button.dart';

class AddNewCardView extends StatelessWidget {
  const AddNewCardView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PaymentCardModel> items = [
      PaymentCardModel(
        icon: 'assets/icons/MasterCard.svg',
        gradient: LinearGradient(
          begin: Alignment(0.00, 0.50),
          end: Alignment(1.00, 0.50),
          colors: [
            const Color(0xFF3B41C5),
            const Color(0xFFA981BB),
            const Color(0xFFFFC8A9)
          ],
        ),
      ),
      PaymentCardModel(
          icon: 'assets/icons/MasterCard.svg',
          gradient: LinearGradient(
            begin: Alignment(0.00, 0.50),
            end: Alignment(1.00, 0.50),
            colors: [const Color(0xFF434343), Colors.black],
          ),
          function: () {
            context.read<CheckoutBloc>().add(
                  MakePaymentEvent(
                    PaymentIntentInputModel(
                      amount: '100',
                      currency: 'usd',
                      customerId: 'cus_SBpu0H2XmJCfiA',
                    ),
                  ),
                );
          }),
      PaymentCardModel(
        icon: 'assets/icons/PayPal.svg',
        gradient: LinearGradient(
          begin: Alignment(0.00, 0.50),
          end: Alignment(1.00, 0.50),
          colors: [const Color(0xFF29323C), const Color(0xFF485563)],
        ),
        function: () {
          var amount = PaypalAmountModel(
            total: '100',
            currency: 'usd',
            details:
                Details(subtotal: '100', shipping: '0', shippingDiscount: 0),
          );
          List<PaypalItem> paypalItem = [
            PaypalItem(
                name: "Apple", quantity: 4, price: '10', currency: "USD"),
            PaypalItem(
                name: "Pineapple", quantity: 5, price: '12', currency: "USD")
          ];
          var paypalItems = PaypalItemListModel(items: paypalItem);
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => PaypalCheckoutView(
              sandboxMode: true,
              clientId: paypalClintId,
              secretKey: paypalSecretId,
              transactions: [
                {
                  "amount": amount.toJson(),
                  "description": "The payment transaction description.",
                  "item_list": paypalItems.toJson()
                }
              ],
              note: "Contact us for any questions on your order.",
              onSuccess: (Map params) async {
                log("onSuccess: $params");
                Navigator.pop(context);
                PaymentSuccessDialog();
              },
              onError: (error) {
                log("onError: $error");
                Navigator.pop(context);
              },
              onCancel: () {
                Navigator.pop(context);
              },
            ),
          ));
        },
      )
    ];
    final PageController pageController = PageController(
      initialPage: 1,
      viewportFraction: 0.85,
    );
    return Scaffold(
      appBar: CheckoutAppBar(),
      body: SingleChildScrollView(
        child: BlocConsumer<CheckoutBloc, CheckoutState>(
          listener: (context, state) {
            if (state is CheckoutSuccess) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const PaymentSuccessDialog(),
              );
            } else if (state is CheckoutFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Payment Failed: ${state.message}")),
              );
            }
          },
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return Center(child: const CircularProgressIndicator());
            }
            return Column(
              children: [
                SizedBox(height: 33.75.h),
                Center(
                  child: Text('PAYMENT METHOD', style: AppTextStyles.title),
                ),
                SvgPicture.asset(
                  'assets/images/3.svg',
                ),
                SizedBox(
                  height: 200.h,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: 3,
                    itemBuilder: (context, index) => CustomPaymentCard(
                      item: items[index],
                    ),
                  ),
                ),
                SvgPicture.asset(
                  'assets/icons/Group 12.svg',
                ),
                CustomTextField(hint: 'Name On Card'),
                CustomTextField(hint: 'Card Number'),
                Row(
                  children: [
                    Expanded(child: CustomTextField(hint: 'Exp Month')),
                    Expanded(child: CustomTextField(hint: 'Exp Month'))
                  ],
                ),
                CustomTextField(hint: 'CVV'),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: CheckoutButton(
        title: 'ADD CARD',
        routeName: 'checkout',
      ),
    );
  }
}
