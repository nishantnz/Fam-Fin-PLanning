import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

import '../utils/my_textField.dart';
import '../utils/routes.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    // bool? formValidation;
    final _formKey = GlobalKey<FormState>();
    final usernameController = new TextEditingController();
    final emailIdController = new TextEditingController();
    final passwordController = new TextEditingController();
    // bool showCompleteAnimation = false;
    // var signUpCompleteAnimationChooser = [
    //   Lottie.asset(
    //     "assets/files/signUp.json",
    //     fit: BoxFit.cover,
    //   ),
    //   Lottie.asset(
    //     "assets/files/signUp2.json",
    //     fit: BoxFit.cover,
    //   ),
    // ];

    // animationTime() async {
    //   Lottie.asset(
    //     "assets/files/signUp.json",
    //     fit: BoxFit.cover,
    //   );
    //   await Future.delayed(const Duration(seconds: 2));
    //   return Lottie.asset(
    //     "assets/files/signUp.json",
    //     fit: BoxFit.cover,
    //     animate: false,
    //   );
    // }

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
                      "assets/files/signUp.json",
                      fit: BoxFit.cover,
                      animate: false,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Create an account",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Welcome $name ",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  //username field
                  const SizedBox(
                    height: 50,
                  ),
                  MyTextField(
                    name: "buhbo",
                    hintText: "Username",
                    obscureText: false,
                    controller: usernameController,
                    formKey: _formKey,
                  ),
                  //email id
                  const SizedBox(
                    height: 30,
                  ),
                  MyTextField(
                    hintText: "Email Id",
                    obscureText: false,
                    controller: emailIdController,
                    formKey: _formKey,
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  //password field
                  MyTextField(
                      hintText: "Password",
                      obscureText: true,
                      controller: passwordController,
                      formKey: _formKey),
                  //forgot passwprd
                  const SizedBox(
                    height: 20,
                  ),

                  //sign in button
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // formValidation = _formKey.currentState!.validate();

                      // if (formValidation == true) {
                      //   setState(() {
                      //     signUpCompleteAnimationChooser = [
                      //       signUpCompleteAnimationChooser[1],
                      //       signUpCompleteAnimationChooser[1],
                      //     ];
                      //   });
                      //   await Future.delayed(const Duration(seconds: 4));
                      Navigator.pushNamed(context, MyRoutes.mainPage);
                    },
                    child: const Text("Sign Up"),
                    style: TextButton.styleFrom(
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 10,
                      backgroundColor: Colors.indigo[900],
                      minimumSize: const Size(150, 50),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //not a member ? sign up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already a member ?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, MyRoutes.loginPage);
                        },
                        child: const Text(
                          "Sign In",
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
