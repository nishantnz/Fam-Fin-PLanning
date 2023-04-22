// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

bool addExp = false;
int count = 1;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpenseTracker(
        title: 'Expense Tracker',
      ),
    );
  }
}

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key, required this.title});

  final String title;

  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  @override
  bool isClicked = false;

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  void initState() {
    ExpenseTracker();
    // count = 0;
  }

  final now = new DateTime.now();
  DateTime? currDay;
  String? todayDate;

  ExpenseTracker() {
    todayDate = DateFormat.yMMMMd('en_US').format(now).toString();
    currDay = new DateTime(now.year, now.month, now.day);
    // count = 0;
    print(todayDate);
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    List<Widget> expenses =
        new List.generate(count - 1, (int i) => AddExpense());

    return SingleChildScrollView(
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                "FINFAM",
                style: TextStyle(
                  letterSpacing: 2.5,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Righteous',
                ),
              ),
            ),
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
          bottomNavigationBar: GNav(
              backgroundColor: Color(0xFF130B74),
              tabBackgroundGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: <Color>[
                  Color(0xFF442489),
                  Color(0xFF442489).withOpacity(0.3),
                ],
                stops: [0.5, 1],
              ),
              rippleColor: Color(0xFF442489)
                  .withOpacity(0.1), // tab button ripple color when pressed
              tabBorderRadius: 30, // tab button border// tab button shadow
              curve: Curves.easeOutExpo, // tab animation curves
              duration: Duration(milliseconds: 500), // tab animation duration
              gap: 5, // the tab button gap between icon and text
              color: Colors.white, // unselected icon color
              activeColor: Colors.white, // selected icon and text color
              iconSize: 35, // tab button icon size
              tabBackgroundColor: Color(0xFF442489)
                  .withOpacity(0.3), // selected tab background color
              padding: EdgeInsets.symmetric(
                  horizontal: 15, vertical: 15), // navigation bar padding
              tabs: [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  textColor: Colors.white,
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Righteous',
                  ),
                ),
                GButton(
                  icon: Icons.file_copy_outlined,
                  text: 'Finances',
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  textColor: Colors.white,
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Righteous',
                  ),
                ),
                GButton(
                  icon: Icons.monetization_on_outlined,
                  text: 'Goals',
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  textColor: Colors.white,
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Righteous',
                  ),
                ),
                GButton(
                  icon: Icons.person_2_outlined,
                  text: 'Profile',
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  textColor: Colors.white,
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Righteous',
                  ),
                )
              ]),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Row(children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isClicked = !isClicked;
                      });
                    },
                    child: Icon(
                      Icons.calendar_month_outlined,
                      size: 50,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    todayDate!,
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Righteous',
                    ),
                  )
                ]),
                if (isClicked)
                  TableCalendar(
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2050, 1, 1),
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                          todayDate = DateFormat.yMMMMd('en_US')
                              .format(_selectedDay!)
                              .toString();
                          isClicked = !isClicked;
                        });
                      }
                    },
                    calendarFormat: _calendarFormat,
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    calendarBuilders: CalendarBuilders(
                      selectedBuilder: (context, day, focusedDay) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF442489).withOpacity(1),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '${day.day}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                      todayBuilder: (context, day, focusedDay) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF442489).withOpacity(0.8),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '${day.day}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                      outsideBuilder: (context, day, focusedDay) {
                        return Container(
                          child: Center(
                            child: Text(
                              '${day.day}',
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        );
                      },
                      defaultBuilder: (context, day, focusedDay) {
                        return Container(
                          child: Center(
                            child: Text(
                              '${day.day}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                if (addExp)
                  Column(
                    children: expenses,
                  ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xFF130B74),
            child: new Icon(
              Icons.add,
              size: 40,
            ),
            onPressed: () {
              setState(() {
                count = count + 1;
                print(count);
                if (count == 2) addExp = !addExp;
                print(addExp);
              });
            },
          ),
        ),
      ),
    );
  }
}

class AddExpense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Add an expense',
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 1,
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5),
              hintText: '\$',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
