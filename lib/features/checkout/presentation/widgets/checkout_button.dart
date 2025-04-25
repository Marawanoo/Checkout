import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_theme.dart';
import '../views/payment_success_dialog.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton(
      {super.key, required this.title, required this.routeName});
  final String title, routeName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
        if (routeName == 'checkout') {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const PaymentSuccessDialog(),
          );
        }
      },
      child: Container(
        width: double.infinity,
        height: 56.h,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/shopping bag white.svg',
            ),
            SizedBox(
              width: 24,
            ),
            Text(
              title,
              style: AppTextStyles.subTitle.copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
