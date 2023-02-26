import 'package:family_financial_planning/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final gradientColor = [
    const Color.fromRGBO(68, 36, 137, 1),
    const Color.fromRGBO(19, 11, 116, 1),
    const Color.fromRGBO(19, 10, 115, 1),
    const Color.fromRGBO(40, 10, 104, 1)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              //logo
              const SizedBox(
                height: 50,
              ),
              const Icon(
                Icons.lock,
                size: 100,
              ),

              const SizedBox(
                height: 50,
              ),
              const Text(
                "Welcome back!",
                style: TextStyle(fontSize: 16),
              ),
              //username field
              const SizedBox(
                height: 50,
              ),
              TextField(
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[500])),
              ),

              //password field

              //forgot passwprd

              //sign in button

              //not a member ? sign in
            ],
          ),
        ),
      ),
    );
  }
}
