import 'dart:ui';

import 'package:family_financial_planning/pages/login.dart';
import 'package:family_financial_planning/utils/images_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    const gradientColor = [
      Color.fromRGBO(68, 36, 137, 1),
      Color.fromRGBO(19, 11, 116, 1),
      Color.fromRGBO(19, 10, 115, 1),
      Color.fromRGBO(40, 10, 104, 1)
    ];
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradientColor),
        ),
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Welcome To !",
              body: "Family Financial Planning",
              image: Lottie.asset("assets/files/welcomeAnimation.json"),
              // ignore: prefer_const_constructors
              decoration: PageDecoration(
                imageAlignment: Alignment.topCenter,
                imagePadding: EdgeInsets.only(top: 20),
                bodyPadding: EdgeInsets.all(10),
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
                bodyTextStyle: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            PageViewModel(
              body: "What do we do here at FFP?",
              reverse: true,
              image: backGroundImage().buildBackgroundImageBlur(),
              titleWidget: AppLogo().appLogo(),

              // ignore: prefer_const_constructors
              decoration: PageDecoration(
                imageFlex: 2,
                imageAlignment: Alignment.center,
                bodyPadding: EdgeInsets.all(2),
                // titlePadding: EdgeInsets.all(20),
                // titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
                bodyTextStyle: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            PageViewModel(
              body: "Manage your finances the fun way.",
              reverse: true,
              image: Lottie.network(
                  "https://assets10.lottiefiles.com/private_files/lf30_ghysqmiq.json"),

              titleWidget: AppLogo().appLogo(),
              footer: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Tell us about your goals,setup a timeline and let us help you achieve them !",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),

              // ignore: prefer_const_constructors
              decoration: PageDecoration(
                imageFlex: 2,
                imagePadding: EdgeInsets.only(bottom: 2, top: 2),
                imageAlignment: Alignment.center,
                bodyPadding: EdgeInsets.only(bottom: 3),
                bodyAlignment: Alignment.center,
                footerFlex: 0,
                bodyTextStyle: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
          globalBackgroundColor: Color.fromARGB(0, 31, 31, 175),
          done: Text("done"),
          // bodyPadding: EdgeInsets.all(20),
          onDone: () {
            Login();
          },

          showNextButton: false,
          isTopSafeArea: true,
          // isBottomSafeArea: true,
        ),
      ),
    );
  }
}
