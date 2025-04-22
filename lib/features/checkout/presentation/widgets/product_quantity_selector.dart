import 'package:checkout_app/features/checkout/presentation/widgets/product_quantity_selector_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/product_item_model.dart';

class ProductQuantitySelector extends StatelessWidget {
  const ProductQuantitySelector(
      {super.key,
      required this.item,
      required this.onAdd,
      required this.onRemove});
  final ProductItemModel item;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProductQuantitySelectorController(
          addOrRemoverFunction: onRemove,
          icon: 'assets/icons/negative.svg',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '${item.quantity}',
            style: TextStyle(
              fontFamily: 'Tenor Sans',
              fontSize: 14.sp,
            ),
          ),
        ),
        ProductQuantitySelectorController(
          addOrRemoverFunction: onAdd,
          icon: 'assets/icons/Plus.svg',
        ),
      ],
    );
  }
}
