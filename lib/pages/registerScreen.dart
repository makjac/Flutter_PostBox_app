// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:post_box/Forms/register_form/registerForm_base.dart';
import 'package:post_box/constans/strings.dart';
import 'package:post_box/cubit/register_cubit.dart';
import 'package:post_box/graphic/appBars/startAppBar.dart';
import 'package:post_box/graphic/alerts/normalAlert.dart';
import 'package:post_box/graphic/templates/page_template.dart';
import '../utils/customScroll.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) => PageTemplate(
        title: "Regiser",
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
                      BlocListener<RegisterCubit, RegisterState>(
                        listener: (context, state) {
                          if (state is Registered) {
                            Navigator.pushNamedAndRemoveUntil(context,
                                START_ROUTE, (Route<dynamic> route) => false);
                          }
                          if (state is InvalidResponse) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return normalAllert(
                                    state.title,
                                    state.body,
                                  );
                                });
                          }
                        },
                        child: RegisterForm(
                          size: MediaQuery.of(context).size.width,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: registerFooter(_pushLoginScreen),
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

  void _pushLoginScreen() {
    Navigator.pushNamed(context, LOGIN_ROUTE);
  }
}
