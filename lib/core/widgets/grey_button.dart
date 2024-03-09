import 'package:flutter/material.dart';
import 'package:investa/core/resource_manager/colors.dart';
import 'package:investa/core/utils/app_size.dart';

class ButtonGrey extends StatelessWidget {
  const ButtonGrey(
      {super.key,
      this.onTap,
      this.width,
      this.height,
      this.color,
      this.text,
      this.textColor});

  final void Function()? onTap;
  final double? width;
  final double? height;
  final Color? color;
  final Color? textColor;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? AppSize.screenWidth!,
        height: height ?? AppSize.defaultSize! * 4.8,
        decoration: BoxDecoration(
            color: color ?? AppColors.containerColor,
            borderRadius: BorderRadius.circular(AppSize.defaultSize!)),
        child: Center(
          child: Text(
            text ?? "",
            style: TextStyle(
                color: textColor ?? AppColors.primaryColor,
                fontSize: AppSize.defaultSize! * 1.5,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
