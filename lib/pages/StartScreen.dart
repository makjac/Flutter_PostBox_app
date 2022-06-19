// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:post_box/graphic/colors.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  void _pushLoginScreen() {
    Navigator.pushNamed(context, '/login');
  }

  void _pushRegisterScreen() {
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [darkGradnientColor, lightGradnientColor]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            logo(),
            const SizedBox(height: 55),
            startForm(_pushLoginScreen, _pushRegisterScreen),
          ],
        ),
      );
}

Widget startForm(VoidCallback loginHandler, VoidCallback registerHandler) =>
    Column(
      children: <Widget>[
        ElevatedButton(
          onPressed: loginHandler,
          child: const Text('Login'),
          style: ElevatedButton.styleFrom(
            primary: buttonFormColor,
            minimumSize: const Size(200, 40),
          ),
        ),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: registerHandler,
          child: const Text('Register'),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: buttonFormColor, width: 2),
            primary: buttonFormColor,
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
            color: shadowFormColor,
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
