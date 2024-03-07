import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:investa/core/resource_manager/colors.dart';
import 'package:investa/core/resource_manager/string_manager.dart';
import 'package:investa/core/utils/app_size.dart';
import 'package:investa/core/widgets/cutom_text.dart';
import 'package:investa/core/widgets/grey_button.dart';

class RecentOrderDetails extends StatefulWidget {
  const RecentOrderDetails({super.key});

  @override
  State<RecentOrderDetails> createState() => _RecentOrderDetailsState();
}

class _RecentOrderDetailsState extends State<RecentOrderDetails> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: AppSize.defaultSize!),
            child: Container(
              width: AppSize.screenWidth!,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.greyColor.withOpacity(.3), width: 1.5),
                  borderRadius: BorderRadius.circular(AppSize.defaultSize!)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.defaultSize! * 2,
                  vertical: AppSize.defaultSize!,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          text: '${StringManager.orderNo.tr()}45788923',
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor,
                          fontSize: AppSize.defaultSize! * 1.4,
                        ),
                        const Spacer(
                          flex: 12,
                        ),
                        CircleAvatar(
                          radius: AppSize.defaultSize! * .5,
                          backgroundColor: AppColors.primaryColor,
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        CustomText(
                          text: StringManager.orderPlaced.tr(),
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor,
                          fontSize: AppSize.defaultSize! * 1.4,
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                    CustomText(
                      text: '20 Mar 2024',
                      color: AppColors.greyColor,
                      fontSize: AppSize.defaultSize! * 1.2,
                    ),
                    SizedBox(
                      height: AppSize.defaultSize!,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: StringManager.orderTotal.tr(),
                          color: AppColors.black,
                          fontSize: AppSize.defaultSize! * 1.4,
                        ),
                        SizedBox(
                          width: AppSize.defaultSize!,
                        ),
                        CustomText(
                          text: '1200 EGP',
                          color: AppColors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: AppSize.defaultSize! * 1.4,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.defaultSize! * 2,
                    ),
                    Center(
                      child: ButtonGrey(
                        height: AppSize.defaultSize! * 4,
                        width: AppSize.screenWidth!,
                        text: StringManager.orderDetails.tr(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
