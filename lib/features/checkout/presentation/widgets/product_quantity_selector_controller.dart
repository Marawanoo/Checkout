import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductQuantitySelectorController extends StatelessWidget {
  const ProductQuantitySelectorController(
      {super.key, required this.addOrRemoverFunction, required this.icon});
  final VoidCallback addOrRemoverFunction;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: addOrRemoverFunction,
      child: Container(
        width: 24.w,
        height: 24.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                width: 1, color: Color(0xFFC4C4C4).withValues(alpha: 0.20))),
        child: Center(
          child: SvgPicture.asset(
            icon,
            width: 16.w,
            height: 16.h,
          ),
        ),
      ),
    );
  }
}
