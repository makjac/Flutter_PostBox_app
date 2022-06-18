// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback? funcHandler;

  const LoginButton({this.funcHandler, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 97, 184, 255),
              minimumSize: const Size(200, 40),
            ),
            onPressed: funcHandler,
            child: const Text(
              "Login",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
