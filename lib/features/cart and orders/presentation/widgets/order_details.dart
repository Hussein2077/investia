import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investa/core/resource_manager/asset_path.dart';
import 'package:investa/core/resource_manager/colors.dart';
import 'package:investa/core/resource_manager/string_manager.dart';
import 'package:investa/core/utils/app_size.dart';
import 'package:investa/core/widgets/app_bar.dart';
import 'package:investa/core/widgets/cutom_text.dart';
import 'package:investa/core/widgets/item_cart.dart';
import 'package:investa/core/widgets/main_button.dart';
import 'package:investa/core/widgets/rate_stars.dart';

class OrderDetailsTrackingScreen extends StatelessWidget {
  const OrderDetailsTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, text: StringManager.orderNo.tr()),
      body: Padding(
        padding: EdgeInsets.all(AppSize.defaultSize!),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppSize.defaultSize! * 2,
              ),
              Center(
                  child: SvgPicture.asset(
                AssetPath.orderTracking,
                fit: BoxFit.fill,
              )),
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
              const Divider(),
              CustomText(
                text: StringManager.yourRate.tr(),
                fontWeight: FontWeight.w700,
                color: AppColors.black,
                fontSize: AppSize.defaultSize! * 1.8,
              ),
              const RateStars(),
              CustomText(
                text: 'Very good experience and very good prices.',
                color: AppColors.black,
                fontSize: AppSize.defaultSize! * 1.4,
                maxLines: 5,
              ),
              SizedBox(
                height: AppSize.defaultSize! * 2,
              ),
              Center(
                  child: MainButton(
                text: StringManager.addRate.tr(),
                width: AppSize.screenWidth!,
              )),
              SizedBox(
                height: AppSize.defaultSize!,
              ),
              Center(
                child: MainButton(
                  text: StringManager.cancelOrder.tr(),
                  color: AppColors.redContainer.withOpacity(.15),
                  textColor: AppColors.redContainer,
                  width: AppSize.screenWidth!,
                ),
              ),
              SizedBox(
                height: AppSize.defaultSize!,
              ),
            ],
          ),
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
