// ignore_for_file: file_names

// ignore: library_prefixes

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:post_box/Forms/login_form/loginForm_base.dart';
import 'package:post_box/constans/strings.dart';
import 'package:post_box/cubit/login_cubit.dart';
import 'package:post_box/graphic/appBars/startAppBar.dart';
import 'package:post_box/graphic/alerts/normalAlert.dart';
import 'package:post_box/graphic/templates/page_template.dart';
import '../utils/customScroll.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => PageTemplate(
        title: "Login",
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
                          BlocListener<LoginCubit, LoginState>(
                            listener: (context, state) {
                              if (state is Logged) {
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    PROFILE_ROUTE,
                                    (Route<dynamic> route) => false);
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
                            child: LoginForm(
                              size: MediaQuery.of(context).size.width,
                            ),
                          ),
                          loginFooter(context),
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
