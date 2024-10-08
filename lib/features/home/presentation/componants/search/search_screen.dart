import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:investa/core/resource_manager/colors.dart';
import 'package:investa/core/resource_manager/string_manager.dart';
import 'package:investa/core/utils/app_size.dart';
import 'package:investa/core/widgets/app_bar.dart';
import 'package:investa/core/widgets/custom_text_field.dart';
import 'package:investa/core/widgets/item_cart.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextField(
          width: AppSize.screenWidth! * .8,
          autofocus: true,
          height: AppSize.defaultSize! * 4,
          prefixIcon: const Icon(Icons.search, color: AppColors.greyColor),
          suffixIcon: const Icon(Icons.close, color: AppColors.greyColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ItemCart(
            isCart: false,
          )),
        ],
      ),
    );
  }
}
