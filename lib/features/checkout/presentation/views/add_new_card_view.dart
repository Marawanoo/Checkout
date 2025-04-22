import 'package:checkout_app/features/checkout/data/models/payment_card_model.dart';
import 'package:checkout_app/features/checkout/presentation/widgets/custom_payment_card.dart';
import 'package:checkout_app/features/checkout/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_theme.dart';
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
      ),
      PaymentCardModel(
        icon: 'assets/icons/PayPal.svg',
        gradient: LinearGradient(
          begin: Alignment(0.00, 0.50),
          end: Alignment(1.00, 0.50),
          colors: [const Color(0xFF29323C), const Color(0xFF485563)],
        ),
      )
    ];
    final PageController pageController = PageController(
      initialPage: 1,
      viewportFraction: 0.85,
    );
    return Scaffold(
      appBar: CheckoutAppBar(),
      body: SingleChildScrollView(
        child: Column(
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
        ),
      ),
      bottomNavigationBar: CheckoutButton(
        title: 'ADD CARD',
        routeName: 'checkout',
      ),
    );
  }
}
