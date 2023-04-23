import 'package:family_financial_planning/pages/navpages/financial_options.dart';
import 'package:family_financial_planning/pages/navpages/goals_page.dart';
import 'package:family_financial_planning/pages/navpages/home_page.dart';
import 'package:family_financial_planning/pages/navpages/profile.dart';
import 'package:family_financial_planning/utils/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pages = [
    HomePage(),
    FinancialOptions(),
    Goals(),
    ProfilePage(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      right: true,
      left: true,
      top: true,
      bottom: true,
      child: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[400],
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Color.fromRGBO(19, 11, 116, 1),
              tooltip: "Home Page",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.text_snippet_outlined),
              label: "Financial Details",
              backgroundColor: Color.fromRGBO(64, 8, 103, 1),
              tooltip:
                  "Enter Your Financial Details and get to know more about plans of Family",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on_outlined),
              label: "Goals",
              backgroundColor: Color.fromRGBO(48, 35, 195, 1),
              tooltip: "Get to know your Goals! ",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_sharp),
              label: "Profile",
              backgroundColor: Colors.indigoAccent,
              tooltip: "Profile Page",
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        appBar: AppBar(
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'Righteous',
            letterSpacing: 2.5,
            fontWeight: FontWeight.bold,
          ),
          title: const Center(
            child: Text(
              "FINFAM",
            ),
          ),
          leading: Image.asset("assets/images/logo.jpg"),
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Color(0xFF130B74),
                  Color(0xFF442489),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
