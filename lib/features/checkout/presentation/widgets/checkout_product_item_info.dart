import 'package:checkout_app/features/checkout/presentation/bloc/checkout_bloc.dart';
import 'package:checkout_app/features/checkout/presentation/bloc/checkout_event.dart';
import 'package:checkout_app/features/checkout/presentation/widgets/product_quantity_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/product_item_model.dart';

class CheckoutProductItemInfo extends StatelessWidget {
  const CheckoutProductItemInfo({
    super.key,
    required this.item,
  });
  final ProductItemModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.title, style: AppTextStyles.subTitle2),
        SizedBox(height: 6.h),
        Text(item.subtitle, style: AppTextStyles.paragraph12),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: ProductQuantitySelector(
              item: item,
              onAdd: () {
                context.read<CheckoutBloc>().add(
                      UpdateQuantity(
                        productId: item.id,
                        newQuantity: item.quantity + 1,
                      ),
                    );
              },
              onRemove: () => context.read<CheckoutBloc>().add(
                    UpdateQuantity(
                      productId: item.id,
                      newQuantity: item.quantity + 1,
                    ),
                  ),
            )),
        Text(
          '\$${(item.price + 5).toStringAsFixed(0)}',
          style: TextStyle(
            color: const Color(0xFFDD8560),
            fontSize: 15,
            fontFamily: 'Tenor Sans',
            fontWeight: FontWeight.w400,
            height: 1.60,
          ),
        ),
      ],
    );
  }
}
