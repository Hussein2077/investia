import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:investa/core/resource_manager/colors.dart';
import 'package:investa/core/resource_manager/string_manager.dart';
import 'package:investa/core/utils/app_size.dart';
import 'package:investa/core/widgets/app_bar.dart';
import 'package:investa/core/widgets/cutom_text.dart';
import 'package:investa/core/widgets/grey_button.dart';
class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, text: StringManager.productDetails.tr()),
      body: Padding(
        padding:   EdgeInsets.all(AppSize.defaultSize!*2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'CeraVe Moisturizing Cream',
              fontWeight: FontWeight.w500,
              color: AppColors.black,
              fontSize: AppSize.defaultSize! * 1.8,
            ),
            SizedBox(
              height: AppSize.defaultSize! * .2,
            ),
            CustomText(
              text: 'CeraVe',
              color: AppColors.greyColor,
              fontSize: AppSize.defaultSize! * 1.4,
            ),
            SizedBox(height: AppSize.defaultSize!*2,),
            Row(
              children: [
                const Icon(Icons.access_time_rounded,color: AppColors.primaryColor,),
                SizedBox(width: AppSize.defaultSize!,),
                CustomText(
                  text: 'Order In 3 Days',
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                  fontSize: AppSize.defaultSize! * 1.2,
                ),
              ],
            ),
            SizedBox(height: AppSize.defaultSize!*2,),
            ButtonGrey(
              text: StringManager.addTo.tr(),
              width: AppSize.screenWidth! * .9,
              height: AppSize.defaultSize! * 4,
            ),  SizedBox(height: AppSize.defaultSize!*4,),
            detailsColumn(text: StringManager.brand.tr(),details: 'CeraVe'),
            SizedBox(height: AppSize.defaultSize!*2,),
            detailsColumn(text: StringManager.size.tr(),details: '500g'),
            SizedBox(height: AppSize.defaultSize!*2,),
            detailsColumn(text: StringManager.productDescription.tr(),details: ''' CeraVe Moisturizing Skin Cream With hyaluronic acid, ceramides and MVE technology for 24 hour hydration. Rich, velvety texture that leaves skin feeling smooth, it is absorbed quickly for softened skin without greasy, sticky, feel.
            '''),
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
          fontSize: AppSize.defaultSize! * 1.5,
        ),
        SizedBox(
          height: AppSize.defaultSize! * .4,
        ),
        SizedBox(
          width: AppSize.screenWidth! * .8,
          child: CustomText(
            text: details,
            textAlign: TextAlign.start,
            color: AppColors.black,
            fontSize: AppSize.defaultSize! * 1.3,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
