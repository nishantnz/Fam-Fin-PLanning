import 'package:family_financial_planning/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class MyHomeWidgets {
  static Container expenseCard() {
    String formattedDay = DateFormat('EEEE').format(DateTime.now());
    String formattedDate = DateFormat('dd').format(DateTime.now());
    String formattedMonthYear =
        DateFormat('MMMM , yyyy').format(DateTime.now());
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 20, bottom: 17, right: 5),
      width: double.infinity,
      height: 165,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Align(
              child: SizedBox(
                width: 289,
                height: 165,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      begin: Alignment(-1, -0.022),
                      end: Alignment(1, -0.022),
                      colors: [Color(0xff130a73), Color(0xff442489)],
                      stops: [0, 1],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 263,
            top: 52,
            child: Align(
              child: SizedBox(
                width: 60,
                height: 60,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 270,
            top: 57,
            child: Align(
              child: SizedBox(
                width: 50,
                height: 50,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25.0),
                    splashColor: Colors.indigo,
                    onTap: () {},
                    child: Container(
                      child: Image.asset("assets/images/plus.png"),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            left: 19,
            top: 25,
            child: SizedBox(
              width: 200,
              height: 15,
              child: Text(
                'TRACK YOUR EXPENSES !',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Positioned(
            left: 19,
            top: 45,
            child: SizedBox(
              width: 174,
              height: 20,
              child: Text(
                formattedDay,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Positioned(
            left: 19,
            top: 70,
            child: SizedBox(
              width: 174,
              height: 70,
              child: Text(
                formattedDate,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          Positioned(
            left: 19,
            top: 110,
            child: SizedBox(
              width: 174,
              height: 20,
              child: Text(
                formattedMonthYear,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Container goalProgress() {
    double percentage = 0.74;
    return Container(
      width: double.infinity,
      height: 270,
      margin: const EdgeInsets.only(left: 20, top: 20, bottom: 17, right: 5),
      child: Stack(
        children: [
          Positioned(
            // rectangle24Sy9 (105:78)
            left: 5,
            top: 30,
            child: SizedBox(
              width: 144,
              height: 40,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-1, 0.032),
                    end: Alignment(0.771, 0.032),
                    colors: [Color(0xff130b74), Color(0xff442489)],
                    stops: [0, 1],
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            // keepgoingtbV (105:94)
            left: 20,
            top: 40,
            child: SizedBox(
              width: 200,
              height: 21,
              child: Text(
                'KEEP GOING !',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Positioned(
            // rectangle24Sy9 (105:78)
            left: 5,
            top: 80,
            child: Align(
              child: SizedBox(
                width: 144,
                height: 90,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(-1, 0.032),
                      end: Alignment(0.771, 0.032),
                      colors: [Color(0xff130b74), Color(0xff442489)],
                      stops: [0, 1],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            // keepgoingtbV (105:94)
            left: 9,
            top: 100,
            child: SizedBox(
              width: 200,
              height: 21,
              child: Text(
                'GOALS !!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Positioned(
            // rectangle24Sy9 (105:78)
            left: 5,
            top: 180,
            child: Align(
              child: SizedBox(
                width: 144,
                height: 50,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(-1, 0.032),
                      end: Alignment(0.771, 0.032),
                      colors: [Color(0xff130b74), Color(0xff442489)],
                      stops: [0, 1],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            // keepgoingtbV (105:94)
            left: 9,
            top: 190,
            child: SizedBox(
              width: 200,
              height: 21,
              child: Text(
                'ALMOST THERE !!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          //white background
          Positioned(
            right: 22,
            top: 25,
            child: Container(
              height: 200,
              width: 200,
              decoration: const ShapeDecoration(
                shape: StadiumBorder(),
                color: Colors.white,
              ),
            ),
          ),
          //circular progress bar/ percentage indicator
          Positioned(
            right: 10,
            top: 30,
            child: CircularPercentIndicator(
              // animateFromLastPercent: true,
              animation: true,
              animationDuration: 500,
              circularStrokeCap: CircularStrokeCap.round,
              // restartAnimation: true,
              radius: 90,
              lineWidth: 20,
              percent: percentage,
              linearGradient: const LinearGradient(
                  colors: MyColors.percentageGradientColor),
              center: Text(
                ((percentage * 100).toStringAsFixed(0)) + "%",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
