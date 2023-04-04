import 'dart:ui';

import 'package:family_financial_planning/pages/login.dart';
import 'package:family_financial_planning/utils/colors.dart';
import 'package:family_financial_planning/utils/images_functions.dart';
import 'package:family_financial_planning/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final gradientColor = MyColors.mygradientColor;

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
                imagePadding: const EdgeInsets.only(top: 20),
                bodyPadding: const EdgeInsets.all(10),
                titleTextStyle:
                    const TextStyle(color: Colors.white, fontSize: 30),
                bodyTextStyle:
                    const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            PageViewModel(
              body: "What do we do here at FFP?",
              reverse: true,
              image: Lottie.asset("assets/files/money.json"),
              titleWidget: AppLogo().appLogo(),
              footer: const Center(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "We help you plan a  financially stable and secure future for you & your loved ones.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              // ignore: prefer_const_constructors
              decoration: PageDecoration(
                imageFlex: 3,
                bodyFlex: 2,
                footerFlex: 1,
                imageAlignment: Alignment.center,
                bodyPadding: const EdgeInsets.all(2),
                // titlePadding: EdgeInsets.all(20),
                // titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
                bodyTextStyle:
                    const TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            PageViewModel(
              body: "Manage your finances the fun way.",
              reverse: true,
              image: Lottie.asset("assets/files/buisness_analytics.json"),

              titleWidget: AppLogo().appLogo(),
              footer: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Tell us about your goals,setup a timeline and let us help you achieve them !",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontStyle: FontStyle.italic),
                ),
              ),

              // ignore: prefer_const_constructors
              decoration: PageDecoration(
                imageFlex: 2,
                imagePadding: const EdgeInsets.only(bottom: 2, top: 2),
                imageAlignment: Alignment.center,
                bodyPadding: const EdgeInsets.only(bottom: 3),
                bodyAlignment: Alignment.center,
                footerFlex: 0,
                bodyTextStyle:
                    const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
          globalBackgroundColor: const Color.fromARGB(0, 31, 31, 175),
          done: const Text(
            "Let's dive in!",
            style: TextStyle(
              color: Color.fromARGB(255, 113, 188, 249),
              fontWeight: FontWeight.bold,
            ),
          ),
          // bodyPadding: EdgeInsets.all(20),
          onDone: () {
            Navigator.pushReplacementNamed(context, MyRoutes.loginPage);
          },

          next: const Text("NEXT"),

          skip: const Text("SKIP"),
          isBottomSafeArea: true,
          dotsDecorator: const DotsDecorator(
              activeColor: Colors.lightBlueAccent,
              color: Colors.white,
              activeShape: OvalBorder(),
              activeSize: Size.fromRadius(8)),
          showNextButton: true,
          // nextStyle: ButtonStyle(iconColor: Colors.lightBlue),
          showSkipButton: true,
          isTopSafeArea: true,
          // isBottomSafeArea: true,
        ),
      ),
    );
  }
}
