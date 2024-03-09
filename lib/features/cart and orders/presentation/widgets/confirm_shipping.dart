import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:investa/core/resource_manager/string_manager.dart';
import 'package:investa/core/widgets/app_bar.dart';

class ConfirmShipping extends StatelessWidget {
  const ConfirmShipping({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, text: StringManager.confirmShippingAddress.tr()),

    );
  }
}
