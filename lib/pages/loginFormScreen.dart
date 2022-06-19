// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:post_box/Forms/login_form/registerForm_base.dart';
import 'package:post_box/graphic/appBars/startAppBar.dart';
import 'customScroll.dart';

class LoginFormPage extends StatefulWidget {
  const LoginFormPage({Key? key}) : super(key: key);

  @override
  State<LoginFormPage> createState() => _LoginFormPageState();
}

class _LoginFormPageState extends State<LoginFormPage> {
  final loginController = TextEditingController();
  final passwdController = TextEditingController();

  bool sh = false;
  String s = 'siema';

  void _login(String login, String passwd) async {
    try {
      final url = Uri.parse('http://makjac.pl:8080/login');
      final response = await http.post(
        url,
        body: {'username': login, 'passwd': passwd},
      );
      // final jsonData = jsonDecode(response.body) as List;
      // setState(() {
      //   _postJson = jsonData;
      // });
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(response.body),
            );
          });
    } catch (err) {
      return;
    }
  }

  void _pushScreen() {
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Login')),
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
                            loginController: loginController,
                            passwdController: passwdController,
                            funcHandler: () {
                              _login(
                                  loginController.text, passwdController.text);
                            },
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
}
