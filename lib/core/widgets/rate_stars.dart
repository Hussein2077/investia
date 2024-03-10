import 'package:flutter/material.dart';
import 'package:investa/core/resource_manager/colors.dart';
import 'package:investa/core/utils/app_size.dart';

class RateStars extends StatelessWidget {
  const RateStars({super.key});

  @override
  Widget build(BuildContext context) {
    return    SizedBox(
      height: AppSize.defaultSize! * 2,
      width: AppSize.screenWidth! * .3,
      child: Row(
        children: [
          SizedBox(
            width: AppSize.defaultSize! * 4,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Icon(
                    Icons.star,
                    color: AppColors.primaryColor,
                    size: AppSize.defaultSize! * 2,
                  );
                }),
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Icon(
                    Icons.star_border,
                    color: AppColors.primaryColor,
                    size: AppSize.defaultSize! * 2,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
