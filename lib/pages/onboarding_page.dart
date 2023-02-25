import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    _buildBackgroundImage() {
      return ClipRect(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1621264448270-9ef00e88a935?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=357&q=80"),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            const Positioned(
              bottom: 100,
              left: 50,
              height: 150,
              width: 300,
              child: Text(
                "We help you plan a  financially stable and secure future for you & your loved ones.",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            )
          ],
        ),
      );
    }

    const gradientColor = [
      Color.fromRGBO(68, 36, 137, 1),
      Color.fromRGBO(19, 11, 116, 1),
      Color.fromRGBO(19, 10, 115, 1),
      Color.fromRGBO(40, 10, 104, 1)
    ];
    return Material(
      child: Container(
        decoration:
            BoxDecoration(gradient: LinearGradient(colors: gradientColor)),
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
                bodyPadding: EdgeInsets.all(20),
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
                bodyTextStyle: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            PageViewModel(
              title: "",
              body: "What do we do here at FFP?",
              reverse: true,
              image: _buildBackgroundImage(),

              // ignore: prefer_const_constructors
              decoration: PageDecoration(
                imageFlex: 2,
                imageAlignment: Alignment.center,
                bodyPadding: EdgeInsets.all(20),
                // titlePadding: EdgeInsets.all(20),
                // titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
                bodyTextStyle: TextStyle(color: Colors.white, fontSize: 25),
              ),
            )
          ],
          globalBackgroundColor: Color.fromARGB(0, 31, 31, 175),
          done: Text("done"),
          onDone: () {},
          showNextButton: false,
          isTopSafeArea: true,
          isBottomSafeArea: true,
        ),
      ),
    );
  }
}
