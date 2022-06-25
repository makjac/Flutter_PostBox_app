// ignore_for_file: file_names

// ignore: library_prefixes
import 'dart:convert' as JSON;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:post_box/Forms/login_form/loginForm_base.dart';
import 'package:post_box/constans/strings.dart';
import 'package:post_box/graphic/appBars/startAppBar.dart';
import 'package:post_box/graphic/alerts/normalAlert.dart';
import 'package:post_box/utils/userSharedPreferences.dart';
import '../utils/customScroll.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginController = TextEditingController();
  final _passwdController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
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
          scrollBehavior: MyBehavior(),
          slivers: [
            SliverPersistentHeader(
              delegate: SliverStartAppBar(),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Center(
                    heightFactor: 1.5,
                    child: SizedBox(
                      height: 391,
                      child: Column(
                        children: [
                          LoginForm(
                            loginController: _loginController,
                            passwdController: _passwdController,
                            funcHandler: () => _login(
                                _loginController.text, _passwdController.text),
                            size: MediaQuery.of(context).size.width,
                          ),
                          loginFooter(_pushScreen),
                        ],
                      ),
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      );

  void _pushScreen() {
    Navigator.pushNamed(context, REGISTER_ROUTE);
  }

  //Display allert
  void _alert(String title, String body) {
    showDialog(
        context: context,
        builder: (context) {
          return normalAllert(
            title,
            body,
          );
        });
  }

  //Send login resquest and get JWT token
  void _login(String login, String passwd) async {
    try {
      final url = Uri.parse('http://makjac.pl:8080/login');
      final response = await http.post(
        url,
        body: {'username': login, 'passwd': passwd},
      );

      switch (response.statusCode) {
        case 200:
          {
            final data = JSON.jsonDecode(response.body);
            await UserSharedPreferences.setToken(data["token"]);
            Navigator.pushNamedAndRemoveUntil(
                context, PROFILE_ROUTE, (Route<dynamic> route) => false);
            break;
          }
        case 401:
          {
            _alert(
              "Wrong data",
              "Opps... Wrong login or password!",
            );
            break;
          }
        case 521:
          {
            _alert(
              "Web server is down",
              "Opps... No connection!",
            );
            break;
          }
      }
    } catch (err) {
      return;
    }
  }
}
