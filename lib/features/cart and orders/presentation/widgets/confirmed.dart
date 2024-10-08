import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investa/core/resource_manager/asset_path.dart';
import 'package:investa/core/resource_manager/colors.dart';
import 'package:investa/core/resource_manager/string_manager.dart';
import 'package:investa/core/utils/app_size.dart';
import 'package:investa/core/widgets/app_bar.dart';
import 'package:investa/core/widgets/cutom_text.dart';
import 'package:investa/core/widgets/grey_button.dart';
import 'package:investa/core/widgets/main_button.dart';

class OrderConfirmed extends StatelessWidget {
  const OrderConfirmed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
              child: SvgPicture.asset(
            AssetPath.confirmed,
            fit: BoxFit.fill,
            width: AppSize.screenWidth!,
          )),
          SizedBox(
            height: AppSize.defaultSize! * 2,
          ),
          CustomText(
            text: StringManager.yourOrderIsPlacedSuccessfully.tr(),
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w700,
            fontSize: AppSize.defaultSize! * 2,
          ),
          SizedBox(
            height: AppSize.defaultSize! * 2,
          ),
          CustomText(
            text: '${StringManager.orderNo.tr()}45788923',
            fontWeight: FontWeight.w700,
            color: AppColors.black,
            fontSize: AppSize.defaultSize! * 1.4,
          ),
          SizedBox(
            height: AppSize.defaultSize! * 6,
          ),
          Center(
              child: MainButton(
            text: StringManager.goToHomePage.tr(),
            width: AppSize.screenWidth! * .9,
          )),
          SizedBox(
            height: AppSize.defaultSize! * 2,
          ),
          Center(
            child: ButtonGrey(
              text: StringManager.orderDetails.tr(),
              width: AppSize.screenWidth! * .9,
            ),
          ),
          SizedBox(
            height: AppSize.defaultSize!,
          ),
        ],
      ),
    );
  }
}
