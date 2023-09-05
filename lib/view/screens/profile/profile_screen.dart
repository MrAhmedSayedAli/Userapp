import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_sharing_user_app/localization/localization_controller.dart';
import 'package:ride_sharing_user_app/util/dimensions.dart';
import 'package:ride_sharing_user_app/util/images.dart';
import 'package:ride_sharing_user_app/util/text_style.dart';
import 'package:ride_sharing_user_app/view/screens/activity/activity_screen.dart';
import 'package:ride_sharing_user_app/view/screens/auth/controller/auth_controller.dart';
import 'package:ride_sharing_user_app/view/screens/auth/sign_in_screen.dart';
import 'package:ride_sharing_user_app/view/screens/message/message_list.dart';
import 'package:ride_sharing_user_app/view/screens/offer/offer_screen.dart';
import 'package:ride_sharing_user_app/view/screens/profile/controller/user_controller.dart';
import 'package:ride_sharing_user_app/view/screens/profile/edit_profile_screen.dart';
import 'package:ride_sharing_user_app/view/screens/profile/widgets/profile_item.dart';
import 'package:ride_sharing_user_app/view/screens/settings/setting_screen.dart';
import 'package:ride_sharing_user_app/view/screens/support/support.dart';
import 'package:ride_sharing_user_app/view/screens/wallet/wallet_screen.dart';
import 'package:ride_sharing_user_app/view/widgets/confirmation_dialog.dart';
import 'package:ride_sharing_user_app/view/widgets/custom_app_bar.dart';
import 'package:ride_sharing_user_app/view/widgets/custom_body.dart';
import 'package:ride_sharing_user_app/view/widgets/custom_image.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double progressValue = 0.7;
    return Scaffold(
      body: GetBuilder<UserController>(builder: (userController){
        return CustomBody(
          appBar: CustomAppBar(title: 'make_your_profile_to_earn_point'.tr,showBackButton: false,centerTitle: true,),
          body: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: SingleChildScrollView(
              child: Column(children:  [
                Padding(padding: const EdgeInsets.fromLTRB(20,40,20,20),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(height: 140, width: 280,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                          color: Theme.of(context).primaryColor.withOpacity(0.1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const SizedBox(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Text("${'level'.tr} : ${ userController.userModel?.userLevelModel?.currentLevel}",style: textBold.copyWith(color: Theme.of(context).hintColor,fontSize: Dimensions.fontSizeSmall)),
                                      const SizedBox(width: 5,),
                                      Image.asset(
                                        userController.userModel?.userLevelModel?.currentLevel=="1"? Images.level1:
                                        userController.userModel?.userLevelModel?.currentLevel=="2"? Images.level2:
                                        userController.userModel?.userLevelModel?.currentLevel=="3"? Images.level3:
                                        userController.userModel?.userLevelModel?.currentLevel=="4"? Images.level4: Images.level5,
                                        width: Dimensions.iconSizeMedium,
                                      )]),
                                    Row(
                                      children: [
                                        Text('${"your_rating".tr} :'.tr,
                                          style: textBold.copyWith(color: Theme.of(context).hintColor,fontSize: Dimensions.fontSizeSmall),),
                                        const SizedBox(height: Dimensions.paddingSizeExtraSmall,),
                                        Text('5'.tr,
                                          style: textBold.copyWith(fontSize: Dimensions.fontSizeSmall,letterSpacing: 3,
                                              color: Theme.of(context).hintColor
                                          ),
                                        ),
                                        const Icon(Icons.star,size: 12,color: Colors.amber,),
                                      ],
                                    )
                                  ],
                                ),
                                CircularPercentIndicator(
                                  radius: 18.0,
                                  lineWidth: 2.5,
                                  percent: progressValue,
                                  backgroundColor: Colors.white,
                                  center: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FittedBox(
                                      child: Text("${progressValue*100}%",
                                        style: textMedium.copyWith(fontSize: 10,color: Theme.of(context).primaryColor),
                                      ),
                                    ),
                                  ),
                                  progressColor: Theme.of(context).primaryColor,
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildColumnItem('total_ride','242',context),
                                Container(width: 1,height: 40,color: Theme.of(context).primaryColor,),
                                _buildColumnItem('total_point','242',context)
                              ],
                            )
                          ],
                        ),
                      ),
                      Positioned(top: -40,
                        left: Get.find<LocalizationController>().isLtr? -25 :null,
                        right: Get.find<LocalizationController>().isLtr? null :-25,

                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle,
                              border: Border.all(color: Theme.of(context).primaryColor,width: 2)
                          ),

                          child: ClipRRect(borderRadius: BorderRadius.circular(50),
                            child: const CustomImage(height: 80, width: 80,
                              image: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                              placeholder: Images.personPlaceholder,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -30,
                        left: Get.find<LocalizationController>().isLtr? 65:0,
                        right: Get.find<LocalizationController>().isLtr? 0:65,
                        child: SizedBox(
                          width: 210,
                          child: Row(children: [
                            Flexible(
                              child: Text(
                                "Norman Bell",style: textBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),
                                maxLines: 1, overflow: TextOverflow.ellipsis,),
                            ),

                          ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                ProfileMenuItem(title: 'profile', icon: Images.profileProfile,
                  onTap: ()=>Get.to(()=>const EditProfileScreen()),
                ),
                ProfileMenuItem(title: 'my_offer', icon: Images.profileMyOrder,
                    onTap:()=>Get.to(()=>const OfferScreen())
                ),
                ProfileMenuItem(title: 'message', icon: Images.profileMessage,
                  onTap: ()=>Get.to(const MessageListScreen()),
                ),
                ProfileMenuItem(title: 'my_wallet', icon: Images.profileMyWallet,
                  onTap: ()=>Get.to(()=>const WalletScreen()),
                ),
                ProfileMenuItem(title: 'my_trips', icon: Images.profileMyTrip,
                  onTap: ()=>Get.to(()=>const ActivityScreen(fromPage: 'profile',)),
                ),

                ProfileMenuItem(title: 'help_support', icon: Images.profileHelpSupport,
                  onTap: ()=>Get.to(const HelpAndSupportScreen()),
                ),
                ProfileMenuItem(title: 'settings', icon: Images.profileSetting,
                  onTap: ()=>Get.to(const SettingScreen()),
                ),
                ProfileMenuItem(title: 'logout', icon: Images.profileLogout,divider: false,
                  onTap: (){
                    showDialog(context: context, builder: (_){
                      return ConfirmationDialog(icon: Images.profileLogout,
                        title: 'logout'.tr,
                        description: 'do_you_want_to_log_out_this_account'.tr, onYesPressed: (){

                          Get.find<AuthController>().clearSharedData().then((condition) {
                            Get.back();
                            Get.offAll(const SignInScreen());
                          });

                        },);
                    });
                  },
                ),
                const SizedBox(height: Dimensions.paddingSizeExtraLarge*4,)
              ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Column _buildColumnItem(String title,String value,BuildContext context) => Column(
    children: [
      Text(value,style: textBold.copyWith(color: Theme.of(context).primaryColor,fontSize: Dimensions.fontSizeExtraLarge),),
      const SizedBox(height: Dimensions.paddingSizeExtraSmall,),
      Text(title.tr,style: textMedium.copyWith(fontSize: Dimensions.fontSizeSmall)),
    ],
  );
}




