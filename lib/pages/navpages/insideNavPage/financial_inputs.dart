import 'package:family_financial_planning/utils/my_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FinacialInputs extends StatelessWidget {
  const FinacialInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              // key: _formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    //logo
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        "Predict how much money you will require to raise the amount of kids you want!",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    //username field
                    const SizedBox(
                      height: 50,
                    ),
                    MyTextField(
                      hintText: "No of Kids?",

                      // controller: usernameController,
                      // formKey: _formKey,
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Predict !"),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.indigo[900],
                        shadowColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 10,
                        minimumSize: const Size(150, 50),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("the Amount will be displayed here"),
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
