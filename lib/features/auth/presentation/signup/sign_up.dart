import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:investa/core/resource_manager/colors.dart';
import 'package:investa/core/resource_manager/routes.dart';
import 'package:investa/core/resource_manager/string_manager.dart';
import 'package:investa/core/utils/app_size.dart';
import 'package:investa/core/widgets/app_bar.dart';
import 'package:investa/core/widgets/cutom_text.dart';
import 'package:investa/core/widgets/main_button.dart';
import 'package:investa/core/widgets/column_with_text_field.dart';
import 'package:investa/core/widgets/major_drop_down.dart';
import 'package:investa/core/widgets/snack_bar.dart';
import 'package:investa/core/widgets/university.dart';
import 'package:investa/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_bloc.dart';
import 'package:investa/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_events.dart';
import 'package:investa/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_states.dart';
import 'package:investa/features/profile/presentation/widgets/upload_cv.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController aNameController;
  late TextEditingController eNameController;
  late TextEditingController purchasingController;
  late TextEditingController agentCodeController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController addressController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmController;
  bool _isChecked = false;
  bool isVisible = false;

  @override
  void initState() {
    aNameController = TextEditingController();
    eNameController = TextEditingController();
    purchasingController = TextEditingController();
    agentCodeController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    addressController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    aNameController.dispose();
    eNameController.dispose();
    purchasingController.dispose();
    agentCodeController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpWithEmailAndPasswordBloc,
        SignUpWithEmailAndPasswordState>(
      listener: (context, state) {
        if (state is SignUpWithEmailAndPasswordSuccessMessageState) {
          EasyLoading.dismiss();
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.main, (route) => false);
        } else if (state is SignUpWithEmailAndPasswordErrorMessageState) {
          EasyLoading.dismiss();
          errorSnackBar(context, StringManager.unexpectedError.tr());
        } else if (state is SignUpWithEmailAndPasswordLoadingState) {
          EasyLoading.show(status: 'loading...');
        }
      },
      child: Scaffold(
        appBar: appBar(context, text: StringManager.signUp.tr()),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: AppSize.defaultSize! * 6.5,
                decoration: BoxDecoration(
                  color: AppColors.containerColor.withOpacity(.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringManager.youAlready.tr(),
                      style: TextStyle(
                          color: AppColors.greyColor,
                          fontSize: AppSize.defaultSize! * 1.4,
                          fontWeight: FontWeight.w700),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.login);
                      },
                      child: Text(
                        StringManager.signIn.tr(),
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: AppSize.defaultSize! * 1.5,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ColumnWithTextField(
                      text: StringManager.firstName.tr(),
                      controller: aNameController,
                    ),
                    ColumnWithTextField(
                      text: StringManager.secondName.tr(),
                      controller: eNameController,
                    ),
                    ColumnWithTextField(
                      text: StringManager.secondName.tr(),
                      controller: purchasingController,
                    ),
                    ColumnWithTextField(
                      text: StringManager.purchasingManager.tr(),
                      controller: purchasingController,
                    ),
                    ColumnWithTextField(
                      text: StringManager.investiaAgentCode.tr(),
                      controller: agentCodeController,
                    ),
                    ColumnWithTextField(
                      text: StringManager.email.tr(),
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColumnWithTextField(
                          text: StringManager.phoneNum.tr(),
                          width: AppSize.screenWidth! * .6,
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3.0),
                          child: MainButton(
                            text: StringManager.verify.tr(),
                            width: AppSize.defaultSize! * 9.6,
                            color: AppColors.greyColor.withOpacity(.5),
                            textColor: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.defaultSize! * 3,
                    ),
                    const UniversityDropDown(),
                    SizedBox(
                      height: AppSize.defaultSize! * 3,
                    ),
                    const MajorDropDown(),
                    ColumnWithTextField(
                      text: StringManager.password.tr(),
                      controller: passwordController,
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        child: Icon(
                          isVisible ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    ColumnWithTextField(
                      text: StringManager.confirmPassword.tr(),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        child: Icon(
                          isVisible ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                      controller: passwordConfirmController,
                    ),
                    SizedBox(
                      height: AppSize.defaultSize! * 3,
                    ),
                    const UploadDoc(),
                    SizedBox(
                      height: AppSize.defaultSize! * 3,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: AppColors.primaryColor,
                          value: _isChecked,
                          side: const BorderSide(
                              color: AppColors.greyColor, width: 2),
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value ?? false;
                            });
                          },
                        ),
                        CustomText(
                          text: StringManager.agreeConditions.tr(),
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ),
                    MainButton(
                      text: StringManager.signUp.tr(),
                      height: AppSize.defaultSize! * 5,
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routes.main, (route) => false);
                        // if (validation()) {
                        //   BlocProvider.of<SignUpWithEmailAndPasswordBloc>(
                        //           context)
                        //       .add(SignUpWithEmailAndPasswordEvent(
                        //     phone: phoneController.text,
                        //     password: passwordController.text,
                        //     major: MajorDropDown.selectedValue?.id.toString() ??
                        //         "0",
                        //     universityID: UniversityDropDown
                        //             .selectedValue?.universityId
                        //             .toString() ??
                        //         "0",
                        //     name: aNameController.text,
                        //     email: purchasingController.text,
                        //     lastName: eNameController.text,
                        //     confirmPassword: passwordConfirmController.text,
                        //   ));
                        // }
                        // else {
                        //   errorSnackBar(context,
                        //       StringManager.pleaseCompleteYourData.tr());
                        // }
                      },
                    ),
                    SizedBox(
                      height: AppSize.defaultSize! * 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dropDownSignUp({
    required String text,
    required String hintText,
    required String selectedValue,
    required List<String> data,
    required void Function(String?)? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: AppSize.defaultSize! * 1.4,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: AppSize.defaultSize! * .3,
        ),
        Container(
          width: AppSize.screenWidth! * .4,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(AppSize.defaultSize! * .5)),
          child: Center(
            child: DropdownButton<String>(
              value: selectedValue,
              underline: const SizedBox(),
              onChanged: onChanged,
              hint: Text(
                hintText,
                style: TextStyle(
                  fontSize: AppSize.defaultSize!,
                ),
              ),
              icon: Padding(
                padding: EdgeInsets.only(left: AppSize.defaultSize! * 3),
                child: Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: AppSize.defaultSize! * 3,
                ),
              ),
              items: data.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: AppSize.defaultSize!,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  bool validation() {
    if (purchasingController.text == '') {
      return false;
    } else if (aNameController.text == '') {
      return false;
    } else if (eNameController.text == '') {
      return false;
    } else if (phoneController.text == '') {
      return false;
    } else if (passwordController.text == '') {
      return false;
    } else if (passwordConfirmController.text == '') {
      return false;
    } else {
      return true;
    }
  }
}
