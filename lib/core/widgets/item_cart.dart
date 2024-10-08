import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:investa/core/resource_manager/colors.dart';
import 'package:investa/core/resource_manager/string_manager.dart';
import 'package:investa/core/utils/app_size.dart';
import 'package:investa/core/widgets/cutom_text.dart';
import 'package:investa/core/widgets/grey_button.dart';
import 'package:investa/core/widgets/product_details.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ItemCart extends StatelessWidget {
  const ItemCart(
      {super.key,
      this.isCart = true,
      this.showPrice = false,
      this.scroll = true});

  final bool isCart;
  final bool showPrice;
  final bool scroll;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        physics: scroll
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        itemBuilder: (context, i) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical:AppSize.defaultSize! * 1.6),
            child: InkWell(
              onTap: (){
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const ProductDetails(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.fade,
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'CeraVe Moisturizing Cream',
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                    fontSize: AppSize.defaultSize! * 1.4,
                  ),
                  SizedBox(
                    height: AppSize.defaultSize! * .2,
                  ),
                  CustomText(
                    text: 'CeraVe',
                    color: AppColors.greyColor,
                    fontSize: AppSize.defaultSize! * 1.2,
                  ),
                  SizedBox(
                    height: AppSize.defaultSize!,
                  ),
                  showPrice
                      ? Row(
                          children: [
                            CustomText(
                              text: '52.5 EGP x4 ',
                              color: AppColors.black,
                              fontSize: AppSize.defaultSize! * 1.4,
                            ),
                            CustomText(
                              text: '  210 EGP',
                              color: AppColors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: AppSize.defaultSize! * 1.4,
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const ShoppingCartItem(),
                            isCart
                                ? ButtonGrey(
                                    text: StringManager.remove.tr(),
                                    width: AppSize.screenWidth! * .5,
                                    color:
                                        AppColors.redContainer.withOpacity(.15),
                                    height: AppSize.defaultSize! * 3.2,
                                    textColor: AppColors.redContainer,
                                  )
                                : ButtonGrey(
                                    text: StringManager.addTo.tr(),
                                    width: AppSize.screenWidth! * .5,
                                    height: AppSize.defaultSize! * 3.2,
                                  ),
                          ],
                        ),
                ],
              ),
            ),
          );
        });
  }
}

class ShoppingCartItem extends StatefulWidget {
  const ShoppingCartItem({super.key});

  @override
  ShoppingCartItemState createState() => ShoppingCartItemState();
}

class ShoppingCartItemState extends State<ShoppingCartItem> {
  int itemCount = 0;

  void incrementItem() {
    setState(() {
      itemCount++;
    });
  }

  void decrementItem() {
    if (itemCount > 0) {
      setState(() {
        itemCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.containerColor,
          radius: AppSize.defaultSize! * 1.6,
          child: IconButton(
            icon: Icon(
              Icons.remove,
              size: AppSize.defaultSize! * 1.4,
            ),
            onPressed: decrementItem,
          ),
        ),
        SizedBox(
          width: AppSize.defaultSize!,
        ),
        CustomText(
          text: itemCount.toString(),
          color: AppColors.primaryColor,
          fontSize: AppSize.defaultSize! * 1.8,
        ),
        SizedBox(
          width: AppSize.defaultSize!,
        ),
        CircleAvatar(
          backgroundColor: AppColors.containerColor,
          radius: AppSize.defaultSize! * 1.6,
          child: IconButton(
            icon: Icon(
              Icons.add,
              size: AppSize.defaultSize! * 1.4,
            ),
            onPressed: incrementItem,
          ),
        ),
      ],
    );
  }
}
