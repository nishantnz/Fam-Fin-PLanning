import 'package:family_financial_planning/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyTextField extends StatefulWidget {
  final hintText;
  bool obscureText;
  final controller;
  final formKey;
  final keyboardType;
  final inputFormatter;
  String? name;

  MyTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.formKey,
    this.name,
    this.keyboardType,
    this.inputFormatter,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatter,
        onChanged: (value) {
          widget.name = value;
          setState(() {});
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        obscureText: widget.obscureText,
        controller: widget.controller,
        decoration: InputDecoration(
            hintText: widget.hintText,
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
    );
  }
}
