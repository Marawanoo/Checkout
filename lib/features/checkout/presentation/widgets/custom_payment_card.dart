import 'package:checkout_app/features/checkout/data/models/payment_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_theme.dart';

class CustomPaymentCard extends StatelessWidget {
  const CustomPaymentCard({super.key, required this.item});
  final PaymentCardModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 316.w,
      height: 190.h,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        gradient: item.gradient,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: SvgPicture.asset(
              item.icon,
              width: 52.15.w,
              height: 32.h,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'IRIS WATSON',
                  style: AppTextStyles.subTitle.copyWith(color: Colors.white),
                ),
                Text(
                  '04/25',
                  style: AppTextStyles.subTitle.copyWith(color: Colors.white),
                )
              ],
            ),
          ),
          Text(
            '2365 3654 2365 3698',
            style: AppTextStyles.title.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
