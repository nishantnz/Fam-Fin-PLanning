import 'dart:convert';

import 'package:family_financial_planning/utils/colors.dart';
import 'package:family_financial_planning/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class FinancialOptions extends StatefulWidget {
  FinancialOptions({Key? key});

  @override
  State<FinancialOptions> createState() => _FinancialOptionsState();
}

class _FinancialOptionsState extends State<FinancialOptions> {
  final TextEditingController kidsController = TextEditingController();
  final TextEditingController incomeController = TextEditingController();
  final TextEditingController debtsController = TextEditingController();
  final TextEditingController investmentController = TextEditingController();
  String prediction = "";
  String predictionkids = "";
  int? countOfTap;

  Future<void> predictIncome() async {
    final url = Uri.parse('http://34.93.226.111/predictIncome');
    final json_data = json.encode({
      'childrens': int.parse(kidsController.text),
    });

    final response = await http.post(url,
        body: json_data, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      setState(() {
        prediction = jsonResponse["Income"].toString().substring(0, 12);
      });
    } else {
      setState(() {
        prediction = 'Failed to predict';
      });
    }
  }

  Future<void> predictKids() async {
    final url = Uri.parse('http://34.93.226.111/predictChildren');
    final json_data = json.encode({
      'income': int.parse(incomeController.text),
      'debt': int.parse(debtsController.text),
      'investment': int.parse(investmentController.text),
    });

    final response = await http.post(url,
        body: json_data, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      setState(() {
        predictionkids = jsonResponse["Number of Children"].toString();
        print(predictionkids);
      });
    } else {
      setState(() {
        predictionkids = 'Failed to predict';
      });
    }
  }

  List items = ["Income/Salary", "Debts/Loans", "Investment"];

  List subTitles = [
    "(Annual)",
    "Tell us about your Loans",
    "Tell us about the investments you make"
  ];
  Map<int, String> hintTexts = {
    0: "Enter your income/salary",
    1: "Tell us about your loans",
    2: "Tell us about the investments you make",
  };

  Map<int, bool> showTextFields = {
    0: false,
    1: false,
    2: false,
  };

  // Map<int, TextEditingController> _textEditingControllers = {
  //   0: TextEditingController(),
  //   1: TextEditingController(),
  //   2: TextEditingController(),
  // };

  // @override
  // void dispose() {
  //   _textEditingControllers.values
  //       .forEach((controller) => controller.dispose());
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white),
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              showTextFields = {
                                0: false,
                                1: false,
                                2: false,
                              };
                              showTextFields[index] = true;
                            });
                          },
                          contentPadding: const EdgeInsets.only(
                              bottom: 15, left: 20, top: 12),
                          leading: Icon(
                            Icons.attach_money_rounded,
                            color: Colors.green[600],
                          ),
                          subtitle: Text(
                            subTitles[index],
                            style: const TextStyle(color: Colors.black),
                          ),
                          title: Text(
                            items[index],
                            style: const TextStyle(color: Colors.black),
                          ),
                          trailing: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: index == 0 && showTextFields[index]!,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 15),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: incomeController,
                                decoration: const InputDecoration(
                                  hintText: '₹ Enter your income/salary',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // ElevatedButton(
                              //   onPressed: () {},
                              //   child: const Text("Save"),
                              // ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "Predict How much income you have to make based on the number of kids you want to achieve?"),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: kidsController,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[1-4]')),
                                ],
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: 'Enter the number of kids',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  predictIncome();
                                },
                                child: Text("Predict"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "You have to make amount  ₹$prediction",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: index == 1 && showTextFields[index]!,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 15),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: debtsController,
                                decoration: const InputDecoration(
                                  hintText: '₹ Tell us about your loans',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              // ElevatedButton(
                              //   onPressed: () {},
                              //   child: const Text("Save"),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: index == 2 && showTextFields[index]!,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 15),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: investmentController,
                                decoration: const InputDecoration(
                                  hintText:
                                      '₹ Tell us about the investments you make',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              // ElevatedButton(
                              //   onPressed: () {},
                              //   child: const Text("Save"),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                predictKids();
                countOfTap = 1;
              },
              child: const Text("Save"),
            ),
          ),
          countOfTap == 1
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: predictionkids.contains("1")
                      ? Text(
                          "You have the capability to take care of $predictionkids children ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        )
                      : Text(
                          "You have the capability to take care of $predictionkids childrens ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
