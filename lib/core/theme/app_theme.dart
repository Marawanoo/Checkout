import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyles {
  static TextStyle title = TextStyle(
    fontSize: 18.sp,
    fontFamily: 'Tenor Sans',
    fontWeight: FontWeight.w400,
    height: 2.22,
    letterSpacing: 4,
    color: Colors.black,
  );

  static TextStyle subTitle = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'Tenor Sans',
    fontWeight: FontWeight.w400,
    height: 1.50,
    letterSpacing: 2,
    color: Colors.black,
  );

  static TextStyle subTitle2 = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'Tenor Sans',
    fontWeight: FontWeight.w400,
    height: 1.43,
    letterSpacing: 2,
    color: const Color(0xFF202224),
  );

  static TextStyle paragraph16 = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'Tenor Sans',
    fontWeight: FontWeight.w400,
    height: 1.50,
    color: const Color(0xFF727272),
  );

  static TextStyle paragraph14 = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'Tenor Sans',
    fontWeight: FontWeight.w400,
    height: 1.71,
    color: const Color(0xFF333333),
  );

  static TextStyle paragraph12 = TextStyle(
    fontSize: 12.sp,
    fontFamily: 'Tenor Sans',
    fontWeight: FontWeight.w400,
    height: 1.50,
    color: const Color(0xFF555555),
  );
}
