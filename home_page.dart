import 'package:family_financial_planning/utils/colors.dart';

import 'package:family_financial_planning/widgets/my_home_widgets.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyHomeWidgets.expenseCard(context),
            MyHomeWidgets.goalProgress(),
            // SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
