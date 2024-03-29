import 'package:family_financial_planning/utils/colors.dart';
import 'package:family_financial_planning/utils/my_textField.dart';
import 'package:family_financial_planning/utils/routes.dart';
import 'package:family_financial_planning/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool animator = false;
  final _formKey = GlobalKey<FormState>();
  final gradientColor = MyColors.mygradientColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  //logo
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Lottie.asset(
                      "assets/files/lock2.json",
                      animate: animator,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Welcome back!",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  //username field
                  const SizedBox(
                    height: 50,
                  ),
                  MyTextField(
                    hintText: "Username",
                    obscureText: false,
                    controller: usernameController,
                    formKey: _formKey,
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  //password field
                  MyTextField(
                      hintText: "Password",
                      obscureText: true,
                      controller: passwordController,
                      formKey: _formKey),
                  //forgot passwprd
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot Password ?",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blueAccent),
                        ),
                      ],
                    ),
                  ),
                  //sign in button
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      //Navigator.pushNamed(context, "/home");

                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          animator = true;
                        });
                        await Future.delayed(const Duration(seconds: 4));
                        Navigator.pushNamed(context, MyRoutes.mainPage);
                      }
                    },
                    style: TextButton.styleFrom(
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 10,
                      backgroundColor: Colors.indigo[900],
                      minimumSize: const Size(150, 50),
                    ),
                    child: const Text("Sign In"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //not a member ? sign up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Not a member ?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, MyRoutes.signUpPage);
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
