import 'package:flutter/material.dart';
import 'package:investa/core/resource_manager/colors.dart';
import 'package:investa/core/utils/app_size.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final double? width;
  final double? height;
  final int? maxLines;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final TextStyle? hintStyle;
  final GlobalKey<FormState>? formKey;

  final Color? fillColor;

  const CustomTextField({
    super.key,
    this.labelText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.hintText,
    this.hintStyle,
    this.width,
    this.height,
    this.maxLines,
    this.formKey,
    this.fillColor,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? AppSize.defaultSize! * 6,
      width: widget.width ?? AppSize.screenWidth! - (AppSize.defaultSize! * 4),
      child: Form(
        key: widget.formKey,
        child: TextFormField(
          onTap: widget.onTap,
          maxLines: widget.maxLines,
          readOnly: widget.readOnly,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please complete this field';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: widget.labelText,
            fillColor: widget.fillColor,
            filled: widget.fillColor != null ? true : false,
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            suffixIcon: widget.suffixIcon,
            contentPadding: EdgeInsets.all(AppSize.defaultSize! * .8),
            labelStyle: TextStyle(
              color: AppColors.primaryColor,
              fontSize: AppSize.screenHeight! * .02,
            ),
            prefixIcon: widget.prefixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.defaultSize! * 1.3),
              borderSide:
                  BorderSide(color: AppColors.greyColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.defaultSize! * 1.3),
              borderSide:
                  BorderSide(color: AppColors.greyColor),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.defaultSize! * 1.3),
                borderSide:
                    BorderSide(color: AppColors.primaryColor)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.defaultSize! * 1.3),
                borderSide:
                    BorderSide(color: AppColors.greyColor)),
          ),
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
        ),
      ),
    );
  }
}
