// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:post_box/graphic/colors.dart';

Widget loginFooter(VoidCallback funcHandler) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      const Text('Don\'t have an account?'),
      TextButton(
          onPressed: funcHandler,
          child: const Text(
            'Register',
            style: TextStyle(
              color: textButtonColor,
            ),
          )),
    ],
  );
}
