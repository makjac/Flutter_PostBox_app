// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:post_box/constans/colors.dart';
import 'package:post_box/constans/strings.dart';

Widget loginFooter(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      const Text('Don\'t have an account?'),
      TextButton(
          onPressed: () => Navigator.pushNamed(context, REGISTER_ROUTE),
          child: const Text(
            'Register',
            style: TextStyle(
              color: TEXT_BUTTON_COLOR,
            ),
          )),
    ],
  );
}
