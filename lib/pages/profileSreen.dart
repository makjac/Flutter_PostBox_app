// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:post_box/cubit/showcase_cubit.dart';

import 'package:post_box/data/models/userShowcase.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  UserShowcase? userShowcase;

  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ShowcaseCubit>(context).fetchShowcase();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
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
      body: BlocBuilder<ShowcaseCubit, ShowcaseState>(
        builder: (context, state) {
          if (state is! ShowcaseLoaded) {
            return const CircularProgressIndicator();
          }

          final showcase = (state).showcase;

          if (!(showcase == null)) {
            return SingleChildScrollView(
              child: Column(
                children: showcase.map((e) => _showcase(e, context)).toList(),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

Widget _showcase(UserShowcase showcase, context) {
  return Text(showcase.toString());
}
