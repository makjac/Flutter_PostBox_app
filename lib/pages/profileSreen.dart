// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_box/constans/colors.dart';
import 'package:post_box/constans/strings.dart';

import 'package:post_box/cubit/showcase_cubit.dart';

import 'package:post_box/data/models/userShowcase.dart';
import 'package:post_box/graphic/templates/logged_page_template.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  UserShowcase? userShowcase;

  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ShowcaseCubit>(context).fetchShowcase();

    return LoggedPageTemplate(
      title: "Profile",
      body: BlocBuilder<ShowcaseCubit, ShowcaseState>(
        builder: (context, state) {
          if (state is! ShowcaseLoaded) {
            return Center(
              child: CircularProgressIndicator(color: Colors.brown[300]),
            );
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
  final size = MediaQuery.of(context).size.width;
  double formSize() {
    if (size < 400) {
      return size;
    } else {
      return 400;
    }
  }

  // return Text(showcase.toString());
  return Column(
    children: [
      _header(showcase.login!),
      const SizedBox(height: 35),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: listDecoration(),
        child: Container(
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: 20,
          ),
          child: Column(
            children: [
              _textRow("First name", showcase.firstName!.trim(), formSize()),
              _textRow("Surname", showcase.surname!.trim(), formSize()),
              _textRow("Phone", showcase.phone!.trim(), formSize()),
              _textRow("Email", showcase.email!.trim(), formSize()),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, EDIT_PROFILE_ROUTE),
                child: const Text("EDIT"),
                style: ElevatedButton.styleFrom(
                  primary: BUTTON_FORM_COLOR,
                  minimumSize: const Size(200, 40),
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _textRow(String title, String bodyText, double size) {
  return SizedBox(
    width: size,
    child: Card(
      margin: const EdgeInsets.only(top: 20),
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color.fromARGB(87, 255, 255, 255),
          width: 3,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const Spacer(),
          Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            color: const Color.fromARGB(83, 234, 234, 234),
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 5,
              ),
              child: Text(
                bodyText,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _header(String login) => Center(
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: Container(
          decoration: headerDecoration(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.brown[400],
                  // radius: 38,
                  minRadius: 38,
                  maxRadius: 48,
                  child: CircleAvatar(
                    backgroundColor: Colors.brown[300],
                    minRadius: 35,
                    maxRadius: 45,
                    child: CircleAvatar(
                      minRadius: 32,
                      maxRadius: 42,
                      backgroundColor: Colors.brown[300],
                      backgroundImage:
                          const AssetImage('assets/images/def_avatar.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  color: Colors.brown[400],
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: Text(login.trim(),
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                )
              ]),
        ),
      ),
    );

BoxDecoration headerDecoration() {
  return const BoxDecoration(
    color: BACKGROUND_FORM_COLOR,
    border: Border.symmetric(
      horizontal: BorderSide(
        width: 5,
        color: BORDER_FORM_COLOR,
      ),
    ),
  );
}

BoxDecoration listDecoration() {
  return BoxDecoration(
    color: BACKGROUND_FORM_COLOR,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(
      width: 4,
      color: BORDER_FORM_COLOR,
    ),
    boxShadow: const [
      BoxShadow(
        color: SHADOW_FORM_COLOR,
        blurRadius: 10,
      ),
    ],
  );
}
