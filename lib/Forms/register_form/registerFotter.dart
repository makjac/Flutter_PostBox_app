// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:post_box/graphic/colors.dart';

Widget registerFooter(VoidCallback funcHandler) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      const Text('Already have an account?'),
      TextButton(
          onPressed: funcHandler,
          child: const Text(
            'Login',
            style: TextStyle(
              color: textButtonColor,
            ),
          )),
    ],
  );
}
