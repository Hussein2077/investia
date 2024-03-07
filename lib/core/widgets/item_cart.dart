import 'package:flutter/material.dart';
import 'package:investa/core/resource_manager/colors.dart';
import 'package:investa/core/utils/app_size.dart';
import 'package:investa/core/widgets/cutom_text.dart';
class ItemCart extends StatelessWidget {
  const ItemCart({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,i){return
    Column(
      children: [
        CustomText(
          text: '20 % Offer',
          fontWeight: FontWeight.w700,
          color: AppColors.primaryColor,
          fontSize: AppSize.defaultSize! * 1.8,
        ),  CustomText(
          text: '20 % Offer',
          fontWeight: FontWeight.w700,
          color: AppColors.primaryColor,
          fontSize: AppSize.defaultSize! * 1.8,
        ),
      ],
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: decrementItem,
        ),
        Text(
          itemCount.toString(),
          style: TextStyle(fontSize: AppSize.defaultSize!),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: incrementItem,
        ),
      ],
    );
  }
}