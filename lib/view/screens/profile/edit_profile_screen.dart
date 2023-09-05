import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_sharing_user_app/util/dimensions.dart';
import 'package:ride_sharing_user_app/util/images.dart';
import 'package:ride_sharing_user_app/util/text_style.dart';
import 'package:ride_sharing_user_app/view/screens/profile/controller/user_controller.dart';
import 'package:ride_sharing_user_app/view/screens/profile/widgets/edit_profile_account_info.dart';
import 'package:ride_sharing_user_app/view/screens/profile/widgets/edit_profile_other_info.dart';
import 'package:ride_sharing_user_app/view/widgets/custom_app_bar.dart';
import 'package:ride_sharing_user_app/view/widgets/custom_body.dart';
import 'package:ride_sharing_user_app/view/widgets/custom_image.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> with SingleTickerProviderStateMixin{
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBody(
        appBar: const CustomAppBar(title: 'make_your_profile_to_earn_point',showBackButton: true,),
        body: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeExtraLarge),
          child: Column(children:  [
            GetBuilder<UserController>(builder: (userController){
              return Row(crossAxisAlignment: CrossAxisAlignment.start,children: [

                InkWell(
                  onTap:()=>userController.pickImage(false, true),
                  child:Container(
                    decoration: BoxDecoration(shape: BoxShape.circle,
                        border: Border.all(color: Theme.of(context).primaryColor,width: 2)
                    ),
                    child: Stack(clipBehavior: Clip.none, children:[
                      userController.pickedProfileFile==null?
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: const CustomImage(height: 70, width: 70,
                          image: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          placeholder: Images.personPlaceholder,
                        ),
                      ):CircleAvatar(radius: 35, backgroundImage:FileImage(File(userController.pickedProfileFile!.path))),

                      Positioned(right: 5, bottom: -3,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle
                          ),
                          padding: const EdgeInsets.all(5),
                          child: const Icon(Icons.camera_enhance_rounded, color: Colors.white,size: 13,
                          ),
                        )
                      )]
                    ),
                  )
                ),

                const SizedBox(width: Dimensions.paddingSizeDefault),

                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(children: [
                      Text(
                        "Norman Bell",style: textBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),
                        maxLines: 1, overflow: TextOverflow.ellipsis,),
                    ]),


                    Row(children: [
                      Text('${"gold_customer".tr} :'.tr,
                        style: textBold.copyWith(color: Theme.of(context).hintColor,fontSize: Dimensions.fontSizeSmall),),
                      const SizedBox(height: Dimensions.paddingSizeExtraSmall,),
                      const Icon(Icons.star,size: 12,color: Colors.amber,),
                      ],
                    ),


                      Row(children: [
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
                ),

              ],
              );
            }),
            const SizedBox(height: Dimensions.paddingSizeExtraLarge,),
            TabBar(
              controller: tabController,
              unselectedLabelColor: Colors.grey,
              labelColor: Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor,
              labelStyle: textSemiBold.copyWith(),
              isScrollable: true,
              indicatorPadding: const EdgeInsets.only(bottom: Dimensions.paddingSizeExtraSmall),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
              padding: const EdgeInsets.all(0),
              tabs:  [
                SizedBox(height: 30,child: Tab(text: 'account_info'.tr)),
                SizedBox(height: 30,child: Tab(text: 'other_info'.tr)),
              ],
            ),
            const SizedBox(height: Dimensions.paddingSizeSmall,),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children:  const [
                  EditProfileAccountInfo(),
                  EditProfileOtherInfo(),
                ],
              ),
            )],
          ),
        ),
      ),
    );
  }
}




