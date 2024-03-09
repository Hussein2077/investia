import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:investa/core/resource_manager/colors.dart';
import 'package:investa/core/resource_manager/routes.dart';
import 'package:investa/core/resource_manager/string_manager.dart';
import 'package:investa/core/utils/app_size.dart';
import 'package:investa/core/widgets/app_bar.dart';
import 'package:investa/core/widgets/custom_text_field.dart';
import 'package:investa/core/widgets/cutom_text.dart';
import 'package:investa/core/widgets/item_cart.dart';
import 'package:investa/core/widgets/main_button.dart';
import 'package:investa/features/cart%20and%20orders/presentation/widgets/confirm_shipping.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, text: StringManager.cart.tr(), leading: false),
      body: Padding(
        padding: EdgeInsets.all(AppSize.defaultSize!),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: StringManager.items.tr() + ' (2)',
              fontWeight: FontWeight.w700,
              color: AppColors.black,
              fontSize: AppSize.defaultSize! * 1.8,
            ),
            Expanded(child: ItemCart()),
            Divider(),
            Padding(
              padding: EdgeInsets.all(AppSize.defaultSize!),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Add note to your order',
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                  fontSize: AppSize.defaultSize! * 1.4,
                ),
              ),
            ),
            CustomTextField(
              height: AppSize.defaultSize! * 10,
              maxLines: 10,
            ),
            SizedBox(
              height: AppSize.defaultSize! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MainButton(
                  text: StringManager.clearCart.tr(),
                  color: AppColors.containerColor,
                  width: AppSize.defaultSize! * 16,
                  textColor: AppColors.primaryColor,
                ),
                MainButton(
                  text: StringManager.next.tr(),
                  width: AppSize.defaultSize! * 16,
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: const ConfirmShipping(),
                      withNavBar: false,
                      // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation: PageTransitionAnimation.fade,
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: AppSize.defaultSize! * 2,
            ),
          ],
        ),
      ),
    );
  }
}
