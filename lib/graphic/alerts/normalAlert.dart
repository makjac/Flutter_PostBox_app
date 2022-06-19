// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget normalAllert(String title, String content) => AlertDialog(
      title: Text(title),
      content: Text(content),
      backgroundColor: const Color.fromARGB(255, 242, 221, 202),
      shape: const Border.symmetric(
        horizontal: BorderSide(width: 4, color: Colors.brown),
        vertical: BorderSide(width: 4, color: Colors.brown),
      ),
    );
