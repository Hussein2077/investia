import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:investa/core/resource_manager/colors.dart';
import 'package:investa/core/resource_manager/string_manager.dart';
import 'package:investa/core/utils/app_size.dart';
import 'package:investa/core/widgets/app_bar.dart';
import 'package:investa/core/widgets/cutom_text.dart';
import 'package:investa/core/widgets/item_cart.dart';
import 'package:investa/core/widgets/main_button.dart';
import 'package:investa/features/cart%20and%20orders/presentation/widgets/confirmed.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class OrderReview extends StatelessWidget {
  const OrderReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, text: StringManager.orderReviewing.tr()),
      body: Padding(
        padding: EdgeInsets.all(AppSize.defaultSize! * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: '${StringManager.items.tr()} (2)',
              fontWeight: FontWeight.w700,
              color: AppColors.black,
              fontSize: AppSize.defaultSize! * 1.8,
            ),
            const ItemCart(
              showPrice: true,
              scroll: false,
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: StringManager.subTotal.tr(),
                  color: AppColors.black,
                  fontSize: AppSize.defaultSize! * 1.4,
                ),
                CustomText(
                  text: '  420 EGP',
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: AppSize.defaultSize! * 1.4,
                ),
              ],
            ),
            SizedBox(
              height: AppSize.defaultSize!,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: StringManager.deliveryPrice.tr(),
                  color: AppColors.black,
                  fontSize: AppSize.defaultSize! * 1.4,
                ),
                CustomText(
                  text: '  60 EGP',
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: AppSize.defaultSize! * 1.4,
                ),
              ],
            ),
            SizedBox(
              height: AppSize.defaultSize!,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: StringManager.orderTotal.tr(),
                  color: AppColors.black,
                  fontSize: AppSize.defaultSize! * 1.4,
                ),
                CustomText(
                  text: '  480 EGP',
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: AppSize.defaultSize! * 1.4,
                ),
              ],
            ),
            const Divider(),
            detailsColumn(
              text: StringManager.pharmacyName.tr(),
              details: 'Al-Shefaa Pharmacy',
            ),
            SizedBox(
              height: AppSize.defaultSize!,
            ),
            detailsColumn(
              text: StringManager.mobileNumber.tr(),
              details: '0112361523',
            ),
            SizedBox(
              height: AppSize.defaultSize!,
            ),
            detailsColumn(
              text: StringManager.pharmacyName.tr(),
              details:
                  '3 Abbas el-Akkad street next to Mobil Station, Madinet Nasr, Cairo',
            ),
            SizedBox(
              height: AppSize.defaultSize! * 4,
            ),
            Center(
                child: MainButton(
              text: StringManager.placeYourOrder.tr(),
              onTap: (){
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const OrderConfirmed(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.fade,
                );
              },
              width: AppSize.screenWidth!,
            )),
          ],
        ),
      ),
    );
  }

  detailsColumn({
    required String text,
    required String details,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: text,
          fontWeight: FontWeight.w700,
          color: AppColors.black,
          fontSize: AppSize.defaultSize! * 1.4,
        ),
        SizedBox(
          height: AppSize.defaultSize! * .3,
        ),
        SizedBox(
          width: AppSize.screenWidth! * .8,
          child: CustomText(
            text: details,
            textAlign: TextAlign.start,
            color: AppColors.black,
            fontSize: AppSize.defaultSize! * 1.2,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
