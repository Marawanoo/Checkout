import 'package:checkout_app/core/theme/app_theme.dart';
import 'package:checkout_app/features/checkout/presentation/bloc/checkout_bloc.dart';
import 'package:checkout_app/features/checkout/presentation/bloc/checkout_state.dart';
import 'package:checkout_app/features/checkout/presentation/widgets/checkout_app_bar.dart';
import 'package:checkout_app/features/checkout/presentation/widgets/checkout_button.dart';
import 'package:checkout_app/features/checkout/presentation/widgets/checkout_product_item.dart';
import 'package:checkout_app/features/checkout/presentation/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CheckoutAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 33.75.h),
            Center(
              child: Text('CHECKOUT', style: AppTextStyles.title),
            ),
            SvgPicture.asset(
              'assets/images/3.svg',
            ),
            BlocBuilder<CheckoutBloc, CheckoutState>(builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CheckoutProductItem(
                  item: context.read<CheckoutBloc>().items[0],
                ),
              );
            }),
            CustomDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 40),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/Voucher.svg',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Add promo code',
                    style: AppTextStyles.paragraph14,
                  ),
                ],
              ),
            ),
            CustomDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 40),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/Door to Door Delivery.svg',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Delivery',
                    style: AppTextStyles.paragraph14,
                  ),
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.right,
                      'Free',
                      style: AppTextStyles.paragraph14,
                    ),
                  ),
                ],
              ),
            ),
            CustomDivider(),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('EST. TOTAL', style: AppTextStyles.subTitle2),
                    Text(
                      '\$${(120 + 5).toStringAsFixed(0)}',
                      style: AppTextStyles.subTitle.copyWith(
                        color: Color(0xFFDD8560),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CheckoutButton(
              title: 'CHECKOUT',
              routeName: 'addNewCard',
            )
          ],
        ),
      ),
    );
  }
}
