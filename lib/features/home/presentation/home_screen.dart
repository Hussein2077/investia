
import 'package:flutter/material.dart';
import 'package:investa/core/resource_manager/colors.dart';
import 'package:investa/core/utils/app_size.dart';
import 'package:investa/core/widgets/app_bar.dart';
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
        widget: CustomText(
          text: 'INTRN',
          fontSize: AppSize.defaultSize! * 3,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w700,
        ),
      ),

    );
  }
}
