import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_sharing_user_app/util/dimensions.dart';
import 'package:ride_sharing_user_app/util/images.dart';
import 'package:ride_sharing_user_app/util/text_style.dart';
import 'package:ride_sharing_user_app/view/screens/map/map_screen.dart';
import 'package:ride_sharing_user_app/view/widgets/weather_assistant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final bool showActionButton;
  final Function()? onBackPressed;
  final bool centerTitle;
  final bool isHome;
  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.onBackPressed,
    this.centerTitle= false,
    this.showActionButton= true,  
    this.isHome = false});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(150.0),
      child: AppBar(
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        title: Text(title.tr, style: textRegular.copyWith(
          fontSize:isHome?  Dimensions.fontSizeExtraLarge : Dimensions.fontSizeLarge,
          color: Colors.white,
        ),maxLines: 2,textAlign: TextAlign.center,),

        flexibleSpace: isHome?GestureDetector(
          onTap: ()=> Get.to(()=> const MapScreen(fromScreen: 'location')),
          child: Padding(
            padding:  const EdgeInsets.fromLTRB(70, 70, Dimensions.paddingSizeDefault,Dimensions.paddingSizeExtraSmall),
            child: Row(children:  [
              const Icon(Icons.place_outlined,color: Colors.white,),
              const SizedBox(width: Dimensions.paddingSizeSmall),
              Text('15 Changi Business Park Cres, shihainaki \nSingapore', style: textRegular.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeSmall))
            ],),
          ),
        ) : const SizedBox.shrink(),
        centerTitle: centerTitle,
        excludeHeaderSemantics: true,
        leading: showBackButton ? IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => onBackPressed != null ? onBackPressed!() : Navigator.pop(context),
        ) :  SizedBox(child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Image.asset(Images.icon),
        ),),
        actions: [
          showActionButton?
          InkWell(
            onTap: (){
              showGeneralDialog(
                context: context,
                barrierDismissible: true,
                transitionDuration: const Duration(milliseconds: 500),
                barrierLabel: MaterialLocalizations.of(context).dialogLabel,
                barrierColor: Colors.black.withOpacity(0.5),
                pageBuilder: (context, _, __) {
                  return const WeatherAssistant();
                },
                transitionBuilder: (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOut,
                    ).drive(Tween<Offset>(
                      begin: const Offset(0, -1.0),
                      end: Offset.zero,
                    )),
                    child: child,
                  );
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15,0, 15, 0),
              child: Image.asset(Images.cloud,width: 20,height: 20,),
            ),
          ):const SizedBox()
        ],
        elevation: 0,
      ),
    );
  }

  @override
  Size get preferredSize => const Size(Dimensions.webMaxWidth, 150);
}