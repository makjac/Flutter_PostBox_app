// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:post_box/Forms/register_form/registerForm_base.dart';
import 'package:post_box/graphic/appBars/startAppBar.dart';
import 'package:post_box/graphic/alerts/normalAlert.dart';
import '../utils/customScroll.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({Key? key}) : super(key: key);

  @override
  State<RegisterFormPage> createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  final _loginController = TextEditingController();
  final _passwdController = TextEditingController();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
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
                  return Column(
                    children: <Widget>[
                      RegisterForm(
                        loginController: _loginController,
                        passwdController: _passwdController,
                        nameController: _nameController,
                        surnameController: _surnameController,
                        phoneController: _phoneController,
                        emailController: _emailController,
                        funcHandler: () => _register(),
                        size: MediaQuery.of(context).size.width,
                      ),
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

  void _pushScreen() {
    Navigator.pushNamed(context, '/login');
  }

  void _register() async {
    final params = {
      "Login": _loginController.text,
      "Passwd": _passwdController.text,
      "Name": _nameController.text,
      "Surname": _surnameController.text,
      "Phone": _phoneController.text,
      "Email": _emailController.text
    };

    final uri = Uri.http("makjac.pl:8080", "/register", params);
    final response = await http.get(uri);

    switch (response.statusCode) {
      case 200:
        {
          Navigator.of(context).pushReplacementNamed('/welcome');
          _alert("Succes",
              "Please click the activation link we sent to your email");
          break;
        }
      case 401:
        {
          _alert("Wrong data", "Opps... Wrong login or password!");
          break;
        }
      case 521:
        {
          _alert("Web server is down", "Opps... No connection!");
          break;
        }
    }
  }
}
