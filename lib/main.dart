import 'package:family_financial_planning/pages/home_page.dart';
import 'package:family_financial_planning/pages/login.dart';
import 'package:family_financial_planning/pages/onboarding_page.dart';
import 'package:family_financial_planning/pages/navpages/profile_page.dart';
import 'package:family_financial_planning/pages/sign_up.dart';
import 'package:family_financial_planning/utils/routes.dart';
import 'package:family_financial_planning/widgets/themes.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const OnBoarding(),
      title: 'FFL',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: MyRoutes.homePage,
      routes: {
        MyRoutes.loginPage: (context) => const LoginPage(),
        MyRoutes.signUpPage: (context) => const SignUpPage(),
        MyRoutes.profile: (context) => const ProfilePage(),
        MyRoutes.homePage: (context) => const HomePage(),
        MyRoutes.onBoarding: (context) => const OnBoarding(),
      },
    );
  }
}
