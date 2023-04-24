import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class OutputPage extends StatefulWidget {
  const OutputPage({super.key});

  @override
  State<OutputPage> createState() => _OutputPageState();
}

class _OutputPageState extends State<OutputPage> {
  Widget? makeCard(String expType, int expense, IconData giveIcon) {
    return Card(
      elevation: 5,
      shadowColor: Color(0xFF442489).withOpacity(0.3),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade400, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(
              giveIcon,
              size: 35,
              color: Color(0xFF130B74).withOpacity(0.9),
            ),
            title: Text(
              expType,
              style: TextStyle(
                fontFamily: "Righetous",
                color: Color(0xFF442489).withOpacity(0.7),
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
            subtitle: Text(
              "Rs.${expense.toString()}",
              style: TextStyle(
                fontFamily: "Righetous",
                color: Colors.grey[750],
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text(
                  "Your Predicted Financial Report",
                  style: TextStyle(
                    fontFamily: "Righetous",
                    color: Colors.grey[750],
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                makeCard("Estimated Housing Expense", 500000, Icons.house)!,
                makeCard("Estimated Food Expense", 300000, Icons.food_bank)!,
                makeCard("Estimated Transportation Expense", 300000,
                    Icons.car_rental)!,
                makeCard("Estimated HealthCare Expense", 200000,
                    Icons.health_and_safety)!,
                makeCard(
                    "Estimated ChildCare Expense", 200000, Icons.child_care)!,
                makeCard("Estimated Taxes Expense", 200000, Icons.money)!,
                makeCard(
                    "Estimated Other Domestic Expenses", 100000, Icons.list)!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
