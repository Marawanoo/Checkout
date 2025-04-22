import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_theme.dart';

class PaymentSuccessDialog extends StatelessWidget {
  const PaymentSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(0),
      backgroundColor: Colors.transparent,
      child: Container(
        width: 343.w,
        height: 500.52.h,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  'assets/icons/Close.svg',
                ),
              ),
            ),
            Text("PAYMENT SUCCESS", style: AppTextStyles.title),
            SizedBox(height: 28.h),
            SvgPicture.asset(
              'assets/icons/Group 268.svg',
            ),
            SizedBox(height: 30.h),
            Text(
                textAlign: TextAlign.center,
                "Your payment was success",
                style: AppTextStyles.title.copyWith(letterSpacing: 0)),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Payment ID ",
                  style: TextStyle(
                    color: const Color(0xFF555555),
                    fontSize: 15,
                    fontFamily: 'Tenor Sans',
                    fontWeight: FontWeight.w400,
                    height: 1.60,
                  ),
                ),
                Text(
                  "15263541",
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 15,
                    fontFamily: 'Tenor Sans',
                    fontWeight: FontWeight.w400,
                    height: 1.60,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: SvgPicture.asset(
                'assets/images/3.svg',
              ),
            ),
            Text(
              "Rate your purchase",
              style: AppTextStyles.title.copyWith(letterSpacing: 0),
            ),
            SizedBox(height: 6.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  'assets/icons/Disappointed.svg',
                ),
                SvgPicture.asset(
                  'assets/icons/Happy.svg',
                ),
                SvgPicture.asset(
                  'assets/icons/In Love.svg',
                ),
              ],
            ),
            SizedBox(height: 28.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 20.w),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "SUBMIT",
                      style:
                          AppTextStyles.subTitle.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      side: BorderSide(
                        width: 1,
                        color: const Color(0xFFDEDEDE),
                      ),
                      shape: RoundedRectangleBorder(),
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 10.w),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      textAlign: TextAlign.center,
                      "BACK TO HOME",
                      style: AppTextStyles.subTitle.copyWith(letterSpacing: 0),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
