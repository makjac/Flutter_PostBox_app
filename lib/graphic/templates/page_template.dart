// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  final Widget? body;
  final String title;
  const PageTemplate({
    Key? key,
    this.body,
    this.title = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
      body: body,
    );
  }
}
