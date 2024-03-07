import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investa/core/resource_manager/asset_path.dart';
import 'package:investa/core/resource_manager/colors.dart';
import 'package:investa/core/resource_manager/routes.dart';
import 'package:investa/core/resource_manager/string_manager.dart';
import 'package:investa/core/utils/app_size.dart';
import 'package:investa/core/widgets/cutom_text.dart';
import 'package:investa/core/widgets/grey_button.dart';
import 'package:investa/core/widgets/main_button.dart';
import 'package:investa/core/widgets/custom_text_field.dart';
import 'package:investa/core/widgets/snack_bar.dart';
import 'package:investa/features/auth/presentation/controller/login_bloc/login_with_email_and_password_bloc.dart';
import 'package:investa/features/auth/presentation/controller/login_bloc/login_with_email_and_password_states.dart';
import 'package:investa/features/auth/presentation/controller/sign_in_with_platform_bloc/sign_in_with_platform_bloc.dart';
import 'package:investa/features/auth/presentation/controller/sign_in_with_platform_bloc/sign_in_with_platform_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocListener<LoginWithEmailAndPasswordBloc,
            LoginWithEmailAndPasswordState>(
          listener: (context, state) {
            if (state is LoginWithEmailAndPasswordSuccessMessageState) {
              EasyLoading.dismiss();
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.main, (route) => false);
            } else if (state is LoginWithEmailAndPasswordErrorMessageState) {
              EasyLoading.dismiss();
              errorSnackBar(context, StringManager.unexpectedError.tr());
            } else if (state is LoginWithEmailAndPasswordLoadingState) {
              EasyLoading.show(status: 'loading...');
            }
          },
          child: BlocListener<SignInWithPlatformBloc, SignInWithPlatformState>(
            listener: (context, state) async {
              if (state is SignWithGoogleSuccesMessageState) {
                // Methods.instance.clearAuthData();
                // BlocProvider.of<GetMyDataBloc>(context).add(GetMyDataEvent());
                if (state.userData.apiUserData.phone == null) {
                  // Navigator.pushNamedAndRemoveUntil(
                  //   context,
                  //   Routes.addInfo,
                  //   arguments: ThirdPartyAuthModel(
                  //     data: state.userData.userData,
                  //     type: "google",
                  //   ),
                  //       (route) => false,
                  // );
                } else {
                  // BlocProvider.of<AddInfoBloc>(context).add(
                  //     AddInfoEvent(email: state.userData.userData.email.toString()));
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.main,
                    (route) => false,
                  );
                }
              } else if (state is SignWithGoogleErrorMessageState) {
                log('${state.errorMessage}ssssssssss');
                errorSnackBar(context, state.errorMessage);
              } else if (state is SignWithPlatFormLoadingState) {}
            },
            child: Padding(
              padding: EdgeInsets.all(AppSize.defaultSize! * 2),
              child: Column(
                children: [
                  SizedBox(
                    height: AppSize.defaultSize! * 6,
                  ),
                  SvgPicture.asset(
                    AssetPath.logo,
                    width: AppSize.defaultSize! * 14,
                    height: AppSize.defaultSize! * 4,
                  ),
                  SizedBox(
                    height: AppSize.defaultSize! * 10,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: StringManager.welcomeBack.tr(),
                        color: AppColors.blackColor,
                        fontSize: AppSize.defaultSize! * 2.4,
                        fontWeight: FontWeight.w700,
                      ),
                      const Spacer(),
                      Image.asset(AssetPath.language),
                      SizedBox(
                        width: AppSize.defaultSize! * .5,
                      ),
                      InkWell(
                        onTap: () {
                          if (context.locale == const Locale('en')) {
                            context.setLocale(const Locale('ar'));
                          } else {
                            context.setLocale(const Locale('en'));
                          }
                          setState(() {});
                        },
                        child: CustomText(
                          text: context.locale == const Locale('en')
                              ? 'العربية'
                              : 'English',
                          color: AppColors.blackColor,
                          fontSize: AppSize.defaultSize! * 1.2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppSize.defaultSize! * 3,
                  ),
                  CustomTextField(
                    formKey: _formKey,
                    labelText: StringManager.email.tr(),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: AppSize.defaultSize!,
                  ),
                  CustomTextField(
                    labelText: StringManager.password.tr(),
                    obscureText: isVisible,
                    controller: passwordController,
                    maxLines: 1,
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.forgetPassword);
                      },
                      child:     CustomText(
                     text:    StringManager.forgetYourPassword.tr(),
                        color: AppColors.forgetPasswordColor,
                        fontSize: AppSize.defaultSize! * 1.4,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  MainButton(
                    text: StringManager.login.tr(),
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.main, (route) => false);
                      // if (validation()) {
                      //   BlocProvider.of<LoginWithEmailAndPasswordBloc>(context)
                      //       .add(LoginWithEmailAndPasswordEvent(
                      //     email: emailController.text,
                      //     password: passwordController.text,
                      //   ));
                      // } else {
                      //   errorSnackBar(
                      //       context, StringManager.pleaseCompleteYourData.tr());
                      // }
                    },
                  ),
                  SizedBox(
                    height: AppSize.screenHeight!*.3,
                  ),
                  Text(
                    StringManager.doNotHaveAccount.tr(),
                    style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: AppSize.defaultSize! * 1.4,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: AppSize.defaultSize! * 1.5,
                  ),

                ButtonGrey(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.signUp,
                    );
                  },
                  text:  StringManager.signUp.tr(),


                ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool validation() {
    if (emailController.text == '') {
      return false;
    } else if (passwordController.text == '') {
      return false;
    } else {
      return true;
    }
  }
}
