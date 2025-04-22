import 'package:checkout_app/features/checkout/data/models/product_item_model.dart';
import 'package:checkout_app/features/checkout/presentation/widgets/checkout_product_item_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutProductItem extends StatelessWidget {
  const CheckoutProductItem({
    super.key,
    required this.item,
  });
  final ProductItemModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 17, top: 27.68),
      child: Row(
        children: [
          // Product Image
          Image.asset(
            item.imagePath,
            width: 100.w,
            height: 133.33.h,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10.72.w),
          // Product Info
          Expanded(
              child: CheckoutProductItemInfo(
            item: item,
          )),
          // Price
        ],
      ),
    );
  }
}
