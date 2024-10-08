import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:investa/core/resource_manager/string_manager.dart';
import 'package:investa/core/utils/app_size.dart';
import 'package:investa/core/widgets/app_bar.dart';
import 'package:investa/core/widgets/column_with_text_field.dart';
import 'package:investa/core/widgets/main_button.dart';
import 'package:investa/core/widgets/major_drop_down.dart';
import 'package:investa/core/widgets/university.dart';
import 'package:investa/features/cart%20and%20orders/presentation/widgets/order_review.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ConfirmShipping extends StatelessWidget {
  const ConfirmShipping({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, text: StringManager.confirmShippingAddress.tr()),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ColumnWithTextField(
              text: StringManager.pharmacyName.tr(),
            ),
            ColumnWithTextField(
              text: StringManager.mobileNumber.tr(),
              keyboardType: TextInputType.phone,
            ),
            ColumnWithTextField(
              text: StringManager.government.tr(),
              keyboardType: TextInputType.phone,
            ),
            ColumnWithTextField(
              text: StringManager.city.tr(),
              keyboardType: TextInputType.phone,
            ),
            ColumnWithTextField(
              text: StringManager.address.tr(),
              keyboardType: TextInputType.phone,
            ),
            // const UniversityDropDown(),
            // SizedBox(
            //   height: AppSize.defaultSize! * 3,
            // ),
            // const MajorDropDown(),
            SizedBox(height: AppSize.defaultSize!*5,),
            MainButton(
              text: StringManager.next.tr(),
              // width: AppSize.defaultSize! * 16,
              onTap: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const OrderReview(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.fade,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
