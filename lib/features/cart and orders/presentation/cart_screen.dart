import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:investa/core/resource_manager/colors.dart';
import 'package:investa/core/resource_manager/string_manager.dart';
import 'package:investa/core/utils/app_size.dart';
import 'package:investa/core/widgets/app_bar.dart';
import 'package:investa/core/widgets/cutom_text.dart';
import 'package:investa/core/widgets/item_cart.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, text: StringManager.cart.tr(),leading: false)
      ,
body: Padding(
  padding: EdgeInsets.all(AppSize.defaultSize!),
  child: Column(
    children: [
      CustomText(
        text: StringManager.items.tr()+' (2)',
        fontWeight: FontWeight.w700,
        color: AppColors.black,
        fontSize: AppSize.defaultSize! * 1.8,
      ),
      Expanded(child: ItemCart()),
    ],
  ),
),
    );
  }
}
