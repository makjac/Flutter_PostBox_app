// ignore_for_file: file_names

import 'package:flutter/material.dart';
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
                    heightFactor: 1.5,
                    child: SizedBox(
                      height: 391,
                      child: Column(
                        children: [],
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
