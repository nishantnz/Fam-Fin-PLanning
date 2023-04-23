import 'package:family_financial_planning/utils/colors.dart';
import 'package:family_financial_planning/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';

class FinancialOptions extends StatelessWidget {
  FinancialOptions({Key? key});

  List items = ["Income/Salary", "Debts/Loans", "Investment"];
  List subTitles = [
    "(Annual)",
    "Tell us about your Loans",
    "Tell us about the investments you make"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15, left: 20, right: 20),
          child: Text(
            "Tell us about your finances💵\n".toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const Center(
          child: Padding(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: Text(
              "So we can help you predict the outcome and future for your kids👶💹",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.blueGrey),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                clipBehavior: Clip.antiAlias,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: const EdgeInsets.all(20),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    gradient: const LinearGradient(colors: MyColors.cardColor),
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        MyRoutes.finacialInputs,
                        arguments: index,
                      );
                    },
                    contentPadding:
                        const EdgeInsets.only(bottom: 15, left: 20, top: 12),
                    leading: Icon(Icons.attach_money_rounded,
                        color: Colors.greenAccent),
                    subtitle: Text(subTitles[index],
                        style: const TextStyle(color: Colors.white)),
                    title: Text(
                      items[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: const Icon(
                      Icons.arrow_right_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
