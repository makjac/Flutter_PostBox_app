// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LoginTextfield extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final bool obscureText;

  const LoginTextfield({
    this.label,
    this.controller,
    this.obscureText = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 20,
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        maxLines: 1,
        maxLength: 100,
        decoration: InputDecoration(
          fillColor: const Color.fromARGB(179, 255, 255, 255),
          filled: true,
          labelText: label,
          border: const OutlineInputBorder(),
          //suffixIcon: Icon(Icons.error_outline_sharp),
        ),
      ),
    );
  }
}
