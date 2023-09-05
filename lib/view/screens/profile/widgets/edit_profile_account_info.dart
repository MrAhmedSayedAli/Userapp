import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_sharing_user_app/util/images.dart';
import 'package:ride_sharing_user_app/view/screens/auth/widgets/test_field_title.dart';
import 'package:ride_sharing_user_app/view/widgets/custom_button.dart';
import 'package:ride_sharing_user_app/view/widgets/custom_text_field.dart';

class EditProfileAccountInfo extends StatelessWidget {
  const EditProfileAccountInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            TextFieldTitle(title: 'name'.tr,textOpacity: 0.8,),
            CustomTextField(
                prefixIcon: Images.editProfileName,
                borderRadius: 10,
                showBorder: false,
                hintText: 'enter_your_name'.tr,
                fillColor: Theme.of(context).primaryColor.withOpacity(0.04)
            ),

            TextFieldTitle(title: 'phone'.tr,textOpacity: 0.8,),
            CustomTextField(
                prefixIcon: Images.editProfilePhone,
                borderRadius: 10,
                showBorder: false,
                hintText: 'enter_your_phone'.tr,
                fillColor: Theme.of(context).primaryColor.withOpacity(0.04)
            ),

            TextFieldTitle(title: 'email'.tr,textOpacity: 0.8,),
            CustomTextField(
                prefixIcon: Images.editProfileEmail,
                borderRadius: 10,
                showBorder: false,
                hintText: 'enter_your_email'.tr,
                fillColor: Theme.of(context).primaryColor.withOpacity(0.04)
            ),

            TextFieldTitle(title: 'address'.tr,textOpacity: 0.8,),
            CustomTextField(
                prefixIcon: Images.editProfileLocation,
                borderRadius: 10,
                showBorder: false,
                hintText: 'enter_your_address'.tr,
                fillColor: Theme.of(context).primaryColor.withOpacity(0.04)
            ),
          ]),
        )),

        const SizedBox(height:30),
        CustomButton (
          buttonText:"update_profile".tr,
          onPressed: ()=> Get.back(),
        )
      ],
    );
  }
}