import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_sharing_user_app/helper/display_helper.dart';
import 'package:ride_sharing_user_app/util/app_constants.dart';
import 'package:ride_sharing_user_app/util/dimensions.dart';
import 'package:ride_sharing_user_app/util/images.dart';
import 'package:ride_sharing_user_app/util/text_style.dart';
import 'package:ride_sharing_user_app/view/screens/auth/additional_sign_up_screen.dart';
import 'package:ride_sharing_user_app/view/screens/auth/controller/auth_controller.dart';
import 'package:ride_sharing_user_app/view/screens/auth/model/sign_up_body.dart';
import 'package:ride_sharing_user_app/view/screens/auth/widgets/test_field_title.dart';
import 'package:ride_sharing_user_app/view/widgets/custom_button.dart';
import 'package:ride_sharing_user_app/view/widgets/custom_text_field.dart';

import '../../../util/app_strings.dart';
import '../../../util/app_style.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: GetBuilder<AuthController>(builder: (authController) {
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: K.fixedPadding0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          Images.logo,
                          width: 120,
                        ),
                        K.sizedBoxH0,
                        Image.asset(
                          Images.signUpScreenLogo,
                          width: 150,
                        ),
                        K.sizedBoxH0,
                      ],
                    ),
                  ),

                  K.sizedBoxH0,
                  Text(Strings.signUp.tr, style: K.primarySmallTextStyle),
                  K.sizedBoxH0,
                  Text(
                    Strings.signUpMessage.tr,
                    style: K.hintMediumTextStyle,
                    maxLines: 2,
                  ),
                  K.sizedBoxH3,
                  Row(children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldTitle(
                            title: Strings.firstName.tr,
                          ),
                          CustomTextField(
                            hintText: Strings.firstName.tr,
                            inputType: TextInputType.name,
                            prefixIcon: Images.person,
                            controller: authController.fNameController,
                            focusNode: authController.fNameNode,
                            nextFocus: authController.lNameNode,
                            inputAction: TextInputAction.next,
                          )
                        ],
                      ),
                    ),
                    K.sizedBoxW0,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldTitle(
                            title: Strings.lastName.tr,
                          ),
                          CustomTextField(
                            hintText: Strings.lastName.tr,
                            inputType: TextInputType.name,
                            prefixIcon: Images.person,
                            controller: authController.lNameController,
                            focusNode: authController.lNameNode,
                            nextFocus: authController.signupPhoneNode,
                            inputAction: TextInputAction.next,
                          )
                        ],
                      ),
                    )
                  ]),

                  TextFieldTitle(
                    title: Strings.phone.tr,
                  ),
                  CustomTextField(
                    hintText: Strings.phone.tr,
                    inputType: TextInputType.number,
                    countryDialCode: "+20",
                    controller: authController.signupPhoneController,
                    focusNode: authController.signupPhoneNode,
                    nextFocus: authController.passwordNode,
                    inputAction: TextInputAction.next,
                    onCountryChanged: (CountryCode countryCode) {
                      authController.countryDialCode = countryCode.dialCode!;
                      authController.signupPhoneController.text =authController. countryDialCode;
                    },
                  ),

                  TextFieldTitle(
                    title: Strings.passwordHint.tr,
                  ),
                  CustomTextField(
                    hintText: Strings.passwordHint.tr,
                    inputType: TextInputType.text,
                    prefixIcon: Images.password,
                    isPassword: true,
                    controller: authController.signupPasswordController,
                    focusNode: authController.passwordNode,
                    nextFocus: authController.signupConfirmPasswordNode,
                    inputAction: TextInputAction.next,
                  ),

                  TextFieldTitle(
                    title: Strings.confirmPassword.tr,
                  ),
                  CustomTextField(
                    hintText: '•••••••••••',
                    inputType: TextInputType.text,
                    prefixIcon: Images.password,
                    controller: authController.confirmPasswordController,
                    focusNode: authController.signupConfirmPasswordNode,
                    inputAction: TextInputAction.done,
                    isPassword: true,
                  ),
                  K.sizedBoxH0,
                  K.sizedBoxH0,
                  K.sizedBoxH0,
                  CustomButton(
                    buttonText: Strings.next.tr,
                    onPressed: authController.validationSignUp(),
                    radius: 50,
                  ),
                  K.sizedBoxH2
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
