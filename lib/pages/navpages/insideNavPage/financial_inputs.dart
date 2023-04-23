import 'dart:convert';
import 'package:family_financial_planning/utils/my_textField.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FinacialInputs extends StatefulWidget {
  const FinacialInputs({Key? key}) : super(key: key);

  @override
  _FinacialInputsState createState() => _FinacialInputsState();
}

class _FinacialInputsState extends State<FinacialInputs> {
  final TextEditingController kidsController = TextEditingController();
  String prediction = "";

  Future<void> predict() async {
    final url = Uri.parse('http://34.93.226.111/predict');
    final json_data = json.encode([
      [int.parse(kidsController.text)]
    ]);

    final response = await http.post(url,
        body: json_data, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      setState(() {
        prediction = jsonResponse.toString();
      });
    } else {
      setState(() {
        prediction = 'Failed to predict';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        "Predict how much money you will require to raise the amount of kids you want!",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    MyTextField(
                      hintText: "No of Kids?",
                      controller: kidsController,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: predict,
                      child: const Text("Predict !"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo[900],
                        shadowColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 10,
                        minimumSize: const Size(150, 50),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text("(In Rs.) ${prediction.toUpperCase()}"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
