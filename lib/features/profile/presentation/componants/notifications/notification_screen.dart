import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:investa/core/resource_manager/asset_path.dart';
import 'package:investa/core/resource_manager/colors.dart';
import 'package:investa/core/resource_manager/string_manager.dart';
import 'package:investa/core/utils/app_size.dart';
import 'package:investa/core/widgets/app_bar.dart';
import 'package:investa/core/widgets/cutom_text.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context,
          text: StringManager.notifications.tr(), leading: false),
      body: Column(

        children: [
          Expanded(

            child: ListView.builder(
                itemCount: 15,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom:AppSize.defaultSize!),
                    child: Column(

                      children: [
                        Padding(
                          padding: EdgeInsets.all(AppSize.defaultSize!),
                          child: Row(
                            children: [
                              // Image.asset(AssetPath.orderPlaced),
                              SizedBox(
                                width: AppSize.defaultSize!,
                              ),
                              SizedBox(
                                width: AppSize.screenWidth! * .7,
                                child: CustomText(
                                  text:
                                      'Your order 45788923 is successfully placed, Thank you.',
                                  textAlign: TextAlign.start,
                                  fontWeight: FontWeight.w700,
                                  maxLines: 2,
                                  color: AppColors.primaryColor,
                                  fontSize: AppSize.defaultSize! * 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
