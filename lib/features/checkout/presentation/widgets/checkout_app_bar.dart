import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CheckoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CheckoutAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Center(
        child: SvgPicture.asset(
          'assets/icons/Menu.svg',
        ),
      ),
      centerTitle: true,
      title: SvgPicture.asset(
        'assets/images/Group.svg',
        width: 78.35.w,
        height: 31.09.h,
      ),
      actions: [
        SvgPicture.asset(
          'assets/icons/Search.svg',
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 23),
          child: SvgPicture.asset(
            'assets/icons/shopping bag.svg',
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
