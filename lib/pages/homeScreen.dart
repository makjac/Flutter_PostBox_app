// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:post_box/graphic/templates/logged_page_template.dart';
import 'package:post_box/graphic/templates/page_template.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => LoggedPageTemplate(
        title: "Post Box",
        body: Column(),
      );
}
