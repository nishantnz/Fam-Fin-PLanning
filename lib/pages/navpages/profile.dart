import 'dart:io';

import 'package:family_financial_planning/utils/colors.dart';
import 'package:family_financial_planning/utils/my_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String selectedImagePath = "";
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final gradientColor = MyColors.mygradientColor;

  // Future pickImage(ImageSource source) async {
  //   final image = await ImagePicker().pickImage(source: source);
  //   if (image == null) return;
  //   File? img = File(image.path);
  //   setState(() {
  //     _image = img;
  //   });
  // }

  final picker = ImagePicker();
  File? img;
  Future pickImage() async {
    XFile? xfile = await picker.pickImage(source: ImageSource.gallery);
    if (xfile == null) return;
    PickedFile? pickedFile = PickedFile(xfile.path);
    setState(() {
      selectedImagePath = pickedFile.path;
    });
  }

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
                    Stack(
                      children: [
                        ClipOval(
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              border: Border.all(width: 2, color: Colors.black),
                            ),
                            child: selectedImagePath.isEmpty
                                ? Icon(
                                    Icons.person,
                                    size: 100,
                                    color: Colors.indigo[900],
                                  )
                                : Image(
                                    image: FileImage(
                                      File(selectedImagePath),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        Positioned(
                          right: 2,
                          bottom: 2,
                          child: IconButton(
                            onPressed: () {
                              pickImage();
                            },
                            icon: Image.asset(
                              "assets/images/camera.png",
                              width: 50,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Create/Complete Your profile below!",
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

                      // controller: usernameController,
                      // formKey: _formKey,
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    //password field
                    MyTextField(
                      hintText: "email Id(at login time)",

                      controller: passwordController,
                      //  formKey: _formKey,
                    ),
                    //forgot passwprd
                    SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                      hintText: "Enter Your Age",
                      keyboardType: TextInputType.number,
                      inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                      controller: usernameController,
                      // formKey: _formKey,
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //sign in button
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        //Navigator.pushNamed(context, "/home");

                        // if (_formKey.currentState!.validate()) {
                        //   setState(() {
                        //     animator = true;
                        //   });
                        //   await Future.delayed(Duration(seconds: 4));
                        //   Navigator.pushNamed(context, MyRoutes.homePage);
                        // }
                      },
                      child: const Text("Save"),
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
