import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ride_sharing_user_app/view/screens/auth/sign_in_screen.dart';

import 'data.dart';
import 'dots.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Stack(
          alignment: Alignment.centerLeft,

          children: [

            Positioned.fill(
              top: -400,
              left: 0,
              right: 0,
              child: Container(
                height: 200,
                decoration:  const BoxDecoration(
                  image:  DecorationImage(
                    image:  AssetImage("assets/images/Vector.png",),
                    fit: BoxFit.fitWidth,),
                ),
              ),
            ),
            PageView.builder(
              controller: _pageController,
              itemCount: tabs.length,
              itemBuilder: (BuildContext context, int index) {
                OnboardingModel tab = tabs[index];
                return Stack(
                  children: [
                    // Image.asset('assets/images/Vector.png'),
                    Positioned(
                      top: 30,
                      child: Image(
                        image: AssetImage(
                          tabs[_currentIndex].image,
                        ),
                        key: Key('${Random().nextInt(999999999)}'),
                        width: 300,
                        fit: BoxFit.contain,
                        height:300,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width:double.infinity,
                        height: 400,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                              Text(tab.title.toString()),

                                  SizedBox(height: 30),
                                TextButton(onPressed: (){}, child: Text('start now ')),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ), Row(
                                // mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      _currentIndex > 0 ?   _pageController.animateToPage(_currentIndex=_currentIndex-1, duration: Duration(milliseconds: 300),
                                        curve: Curves.easeIn,):null;
                                      setState(() {});
                                    },
                                    child:  Text(
                                      _currentIndex > 0 ? 'السابق' : '',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                SizedBox(width:30),
                                  // K.sizedBoxW,
                                  for (int index = 0; index < tabs.length; index++)
                                    DotIndicator(
                                      isSelected: index == _currentIndex,
                                    ),
                                  SizedBox(width:30),
                                  InkWell(
                                    onTap: (){
                                      setState(() {});
                                      _currentIndex !=2? _pageController.animateToPage(
                                        _currentIndex=_currentIndex+1, duration: Duration(milliseconds: 300),
                                        curve: Curves.easeIn,)
                                          :  Get.to(()=> const SignInScreen());
                                    },
                                    child: Text(
                                      'التالي',
                                      style: TextStyle(
                                          color:  Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              onPageChanged: (value) {
                _currentIndex = value;
                setState(() {});
              },
            ),
          ],
        ));
  }
}




class OnboardingModel {
  final String image;
  final String ?title;
  final String ?subtitle;

  OnboardingModel(this.image, this.title, this.subtitle,   );
}