import 'package:family_financial_planning/utils/colors.dart';
import 'package:family_financial_planning/widgets/bottomNavBar.dart';
import 'package:family_financial_planning/widgets/expense_tacker_card.dart';
import 'package:family_financial_planning/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double percentage = 0.74;
    return SafeArea(
      right: true,
      left: true,
      top: true,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          title: GradientText(
            "FINFAM",
            colors: MyColors.appbartitlecolor,
            gradientType: GradientType.linear,
            style: const TextStyle(fontSize: 32),
          ),
          leading: Image.asset("assets/images/logo.jpg"),
        ),
        bottomNavigationBar: MyNavBarFul(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyExpenseTrackerCard.expenseCard(),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Add an empty container to push the indicator to the right
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: CircularPercentIndicator(
                      // animateFromLastPercent: true,
                      animation: true,
                      animationDuration: 500,
                      circularStrokeCap: CircularStrokeCap.round,
                      // restartAnimation: true,
                      radius: 80,
                      lineWidth: 20,
                      percent: percentage,
                      linearGradient: const LinearGradient(
                          colors: MyColors.percentageGradientColor),
                      center: Text(
                        ((percentage * 100).toStringAsFixed(0)) + "%",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
