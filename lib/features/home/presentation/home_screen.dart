import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investa/core/resource_manager/asset_path.dart';
import 'package:investa/core/resource_manager/colors.dart';
import 'package:investa/core/resource_manager/string_manager.dart';
import 'package:investa/core/utils/app_size.dart';
import 'package:investa/core/widgets/app_bar.dart';
import 'package:investa/core/widgets/custom_text_field.dart';
import 'package:investa/core/widgets/cutom_text.dart';
import 'package:investa/features/home/presentation/componants/search/search_screen.dart';
import 'package:investa/features/home/presentation/widget/home_details_screen.dart';
import 'package:investa/features/home/presentation/widget/recent_order_details.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(
        context,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize!),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: AppSize.defaultSize! * 2,
            ),
            Center(
              child: CustomTextField(
                hintText: StringManager.searchForPharmaceutical.tr(),
                readOnly: true,
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: const SearchScreen(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.fade,
                  );
                },
                hintStyle: TextStyle(
                    fontSize: AppSize.defaultSize! * 1.4,
                    color: AppColors.greyColor),
                fillColor: AppColors.borderColor,
                prefixIcon:
                    const Icon(Icons.search, color: AppColors.greyColor),
              ),
            ),
            SizedBox(
              height: AppSize.defaultSize! * 2,
            ),
            SizedBox(
              height: AppSize.screenHeight! * .36,
              child: GridView.builder(
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return homeCard();
                },
              ),
            ),
            Center(
              child: Container(
                // width: AppSize.screenWidth! * .91,
                height: AppSize.defaultSize! * 10.4,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.greyColor.withOpacity(.3), width: 1.5),
                    borderRadius: BorderRadius.circular(AppSize.defaultSize!)),
                child: Padding(
                  padding: EdgeInsets.all(AppSize.defaultSize!),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        AssetPath.offer,
                        width: AppSize.defaultSize! * 7.8,
                        height: AppSize.defaultSize! * 7.2,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: '20 % Offer',
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor,
                            fontSize: AppSize.defaultSize! * 1.8,
                          ),
                          CustomText(
                            text:
                                'if you bought more than 1500 EGP \nor more you will get 20% off',
                            maxLines: 4,
                            textAlign: TextAlign.start,
                            fontSize: AppSize.defaultSize! * 1.3,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppSize.defaultSize! * 2,
            ),
            CustomText(
              text: StringManager.recentOrders.tr(),
              fontWeight: FontWeight.w700,
              color: AppColors.black,
              fontSize: AppSize.defaultSize! * 1.8,
            ),
            SizedBox(
              height: AppSize.defaultSize!,
            ),
            const RecentOrderDetails(
              scroll: false,
            ),
            SizedBox(
              height: AppSize.defaultSize! * 3,
            ),
          ]),
        ),
      ),
    );
  }

  homeCard() {
    return Padding(
      padding: EdgeInsets.all(AppSize.defaultSize!),
      child: ElevatedButton(
        onPressed: () {
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: const HomeDetailsScreen(),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.fade,
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius:
             BorderRadius.circular(AppSize.defaultSize!)),
          ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetPath.medicine),
            CustomText(text: StringManager.medicine.tr())
          ],
        ),
      ),
    );
  }
}
