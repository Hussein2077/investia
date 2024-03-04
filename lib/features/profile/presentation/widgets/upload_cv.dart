import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:investa/core/resource_manager/asset_path.dart';
import 'package:investa/core/resource_manager/colors.dart';
import 'package:investa/core/resource_manager/string_manager.dart';
import 'package:investa/core/utils/app_size.dart';

class UploadDoc extends StatefulWidget {
  const UploadDoc({super.key});

  @override
  State<UploadDoc> createState() => _UploadDocState();
}

class _UploadDocState extends State<UploadDoc> {
  FilePickerResult? result;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        result = await FilePicker.platform.pickFiles();

        if (result != null) {
          File file = File(result?.files.single.path ?? "");
        } else {
          print("No file selected");
        }
      },
      child: Container(
        height: AppSize.defaultSize! * 14.3,
        decoration: BoxDecoration(
          color: AppColors.borderColor.withOpacity(.5),
          borderRadius: BorderRadius.circular(AppSize.defaultSize!),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AssetPath.doc),
              SizedBox(
                height: AppSize.defaultSize!,
              ),
              Text(
                result?.files[0].name != null
                    ? '${result?.files[0].name} '
                    : StringManager.tabToUploadDoc.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppSize.defaultSize! * 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
