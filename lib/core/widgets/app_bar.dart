import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investa/core/resource_manager/asset_path.dart';
import 'package:investa/core/resource_manager/colors.dart';
import 'package:investa/core/utils/app_size.dart';
import 'package:investa/core/widgets/cutom_text.dart';

AppBar appBar(BuildContext context,
    {required String text, bool leading = true}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 1,
    title: Text(
      text,
      style: TextStyle(
          fontSize: AppSize.defaultSize! * 2, fontWeight: FontWeight.w500),
    ),
    centerTitle: true,
    leading: leading
        ? IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          )
        : null,
  );
}

AppBar homeAppBar(BuildContext context,
    {String? text, void Function()? actionsOnPressed, Widget? widget}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 1,
    // title: widget ,
    centerTitle: false,
    title: SvgPicture.asset(
      AssetPath.logo,
      width: AppSize.defaultSize! * 14,
      height: AppSize.defaultSize! * 4,
    ),
    actions: [
      InkWell(
        onTap: () {
          if (context.locale == const Locale('en')) {
            context.setLocale(const Locale('ar'));
          } else {
            context.setLocale(const Locale('en'));
          }
          // setState(() {});
        },
        child: Row(
          children: [
            Image.asset(
              AssetPath.language,
            ),
            SizedBox(
              width: AppSize.defaultSize! * .5,
            ),
            CustomText(
              text:
                  context.locale == const Locale('en') ? 'العربية' : 'English',
              color: AppColors.blackColor,
              fontSize: AppSize.defaultSize! * 1.4,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
      SizedBox(
        width: AppSize.defaultSize! * 2,
      ),
      // IconButton(
      //   onPressed: actionsOnPressed,
      //   icon: Image.asset(
      //     AssetPath.notification,
      //     width: AppSize.defaultSize! * 2,
      //     height: AppSize.defaultSize! * 2,
      //   ),
      // )
    ],
  );
}
/*
 AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          title: Image.asset(AssetPath.logo,scale: 3,),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: AppColors.primaryColor,
              ),
              onPressed: () {},
            ),
          ],
        ),
 */
