import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investa/core/resource_manager/asset_path.dart';
import 'package:investa/core/resource_manager/colors.dart';
import 'package:investa/core/resource_manager/routes.dart';
import 'package:investa/core/resource_manager/string_manager.dart';
import 'package:investa/core/utils/app_size.dart';
import 'package:investa/core/widgets/app_bar.dart';
import 'package:investa/core/widgets/cutom_text.dart';
import 'package:investa/features/auth/presentation/login_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, text: StringManager.menu.tr(), leading: false),
      body: Padding(
        padding: EdgeInsets.all(AppSize.defaultSize! * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  height: AppSize.defaultSize! * 4.8,
                  width: AppSize.defaultSize! * 4.8,
                  child: Image.asset(
                    AssetPath.testImage,
                  ),
                ),
                SizedBox(
                  width: AppSize.defaultSize!,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Al-Shefaa Pharmacy',
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                      fontSize: AppSize.defaultSize! * 1.4,
                    ),
                    CustomText(
                      text: StringManager.editYourProfile.tr(),
                      textAlign: TextAlign.start,
                      color: AppColors.greyColor,
                      fontSize: AppSize.defaultSize! * 1.4,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: AppSize.defaultSize! * 3,
            ),
            iconWithTextRow(
                image: AssetPath.settings, text: StringManager.settings.tr()),
            const Divider(),
            iconWithTextRow(
                image: AssetPath.helpAndSupport,
                text: StringManager.helpAndSupport.tr()),
            const Divider(),
            iconWithTextRow(
                image: AssetPath.feedback, text: StringManager.feedback.tr()),
            Spacer(),
            InkWell(
              onTap: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const LoginScreen(),
                  withNavBar: false,
                  // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.fade,
                );
               },
              child: Center(
                child: Container(
                  height: AppSize.defaultSize! * 5,
                  // width: AppSize.screenWidth! * .6,
                  decoration: BoxDecoration(
                      color: AppColors.containerColor,
                      borderRadius:
                      BorderRadius.circular(AppSize.defaultSize!),
                     ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout,
                        color: AppColors.primaryColor,
                        size: AppSize.defaultSize! * 2,
                      ),
                      SizedBox(
                        width: AppSize.defaultSize!,
                      ),
                      CustomText(
                        text:   StringManager.logOut.tr(),
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: AppSize.defaultSize! * 1.4,
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  iconWithTextRow({required String image, required String text}) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSize.defaultSize! * 2),
      child: Row(
        children: [
          SvgPicture.asset(image),
          SizedBox(
            width: AppSize.defaultSize! * 2,
          ),
          CustomText(
            text: text,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w600,
            maxLines: 2,
            color: AppColors.black,
            fontSize: AppSize.defaultSize! * 1.8,
          ),
        ],
      ),
    );
  }
}
