// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:post_box/constans/colors.dart';
import 'package:post_box/constans/strings.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [DARK_GRADIENT_COLOR, LIGHT_GRADIENT_COLOR]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            logo(),
            const SizedBox(height: 55),
            startForm(context),
          ],
        ),
      );
}

Widget startForm(BuildContext context) => Column(
      children: <Widget>[
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, LOGIN_ROUTE),
          child: const Text('Login'),
          style: ElevatedButton.styleFrom(
            primary: BUTTON_FORM_COLOR,
            minimumSize: const Size(200, 40),
          ),
        ),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: () => Navigator.pushNamed(context, REGISTER_ROUTE),
          child: const Text('Register'),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: BUTTON_FORM_COLOR, width: 2),
            primary: BUTTON_FORM_COLOR,
            minimumSize: const Size(200, 40),
          ),
        )
      ],
    );

Widget logo() => Container(
      height: 230,
      width: 230,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: SHADOW_FORM_COLOR,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/postbox_logo_mini.png'),
          const SizedBox(height: 10),
          Text(
            'Post Box',
            style: TextStyle(
                fontSize: 30,
                color: Colors.brown[700],
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
