// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_box/Forms/Profil_form/edit_profil_form.dart';
import 'package:post_box/constans/strings.dart';
import 'package:post_box/cubit/edit_profile_cubit.dart';
import 'package:post_box/graphic/graphic_base.dart';
import 'package:post_box/graphic/templates/logged_page_template.dart';
import 'package:post_box/utils/utils_base.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => LoggedPageTemplate(
        title: "Edit profile",
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
                    child: SizedBox(
                      height: 475,
                      child: Column(
                        children: [
                          BlocListener<EditProfileCubit, EditProfileState>(
                            listener: (context, state) {
                              if (state is Updated) {
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
                            child: EditProfilForm(
                                size: MediaQuery.of(context).size.width),
                          )
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
