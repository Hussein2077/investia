import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:investa/core/resource_manager/colors.dart';
import 'package:investa/core/resource_manager/string_manager.dart';
import 'package:investa/core/utils/app_size.dart';
import 'package:investa/core/widgets/app_bar.dart';
import 'package:investa/core/widgets/custom_text_field.dart';
import 'package:investa/core/widgets/item_cart.dart';

class HomeDetailsScreen extends StatelessWidget {
  const HomeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appBar(context, text: StringManager.medicine.tr()),
      body: Column(
        children: [
          CustomTextField(
            hintText: StringManager.searchForPharmaceutical.tr(),
            hintStyle: TextStyle(
                fontSize: AppSize.defaultSize! * 1.4,
                color: AppColors.greyColor),
            fillColor: AppColors.borderColor,
            prefixIcon:
            const Icon(Icons.search, color: AppColors.greyColor),
          ),
          Expanded(
              child: ItemCart(
                isCart: false,
              )),
        ],
      ),
    );
  }
}
