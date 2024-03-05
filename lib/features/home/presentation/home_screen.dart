import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:investa/core/resource_manager/asset_path.dart';
import 'package:investa/core/resource_manager/colors.dart';
import 'package:investa/core/resource_manager/string_manager.dart';
import 'package:investa/core/utils/app_size.dart';
import 'package:investa/core/widgets/app_bar.dart';
import 'package:investa/core/widgets/custom_text_field.dart';
import 'package:investa/core/widgets/cutom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.onPressedIntern, this.onPressedJob});

  final void Function()? onPressedJob;
  final void Function()? onPressedIntern;

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
      body: Center(
        child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: AppSize.defaultSize! * 2,
              ),
              CustomTextField(
                hintText: StringManager.searchForPharmaceutical.tr(),
                readOnly: true,
                onTap: () {},
                hintStyle: TextStyle(
                    fontSize: AppSize.defaultSize! * 1.4,
                    color: AppColors.greyColor),
                fillColor: AppColors.borderColor,
                prefixIcon:
                    const Icon(Icons.search, color: AppColors.greyColor),
              ),
              SizedBox(
                height: AppSize.defaultSize! * 2,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                  childAspectRatio: 1.3,

                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return homeCard();
                  },
                ),
              ),
            ]),
      ),
    );
  }

  homeCard() {
    return Padding(
      padding: EdgeInsets.all(AppSize.defaultSize!),
      child: Container(
        // height: AppSize.defaultSize! * 5.4,
        // width: AppSize.defaultSize! * 16,
        decoration: BoxDecoration(
            color: AppColors.containerColor2,
            borderRadius: BorderRadius.circular(AppSize.defaultSize!)),
        child: Column(
          children: [Image.asset(AssetPath.language)],
        ),
      ),
    );
  }
}
