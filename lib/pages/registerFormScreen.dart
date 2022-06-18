// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:post_box/Forms/register_form/registerForm_base.dart';

import 'package:post_box/graphic/appBars/startAppBar.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({Key? key}) : super(key: key);

  @override
  State<RegisterFormPage> createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  void _pushScreen() {
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Register')),
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFE0852F), Color(0xFFE6AB75)],
              ),
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 242, 221, 202),
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: SliverStartAppBar(),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      RegisterForm(),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: registerFooter(_pushScreen),
                      ),
                    ],
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      );
}
