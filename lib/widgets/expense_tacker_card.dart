import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyExpenseTrackerCard {
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
}
