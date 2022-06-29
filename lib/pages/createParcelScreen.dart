// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_box/Forms/Create_parcel_form/create_parcel_form.dart';
import 'package:post_box/constans/strings.dart';
import 'package:post_box/cubit/create_parcel_cubit.dart';
import 'package:post_box/graphic/graphic_base.dart';
import 'package:post_box/graphic/templates/logged_page_template.dart';

class CreateParcelPage extends StatelessWidget {
  const CreateParcelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //BlocProvider.of<ShowcaseCubit>(context).fetchShowcase();
    BlocProvider.of<CreateParcelCubit>(context).fetchPstmachines();
    return LoggedPageTemplate(
      title: "New Parcel",
      body: BlocListener<CreateParcelCubit, CreateParcelState>(
        listener: (context, state) {
          if (state is Created) {
            Navigator.pushNamedAndRemoveUntil(
                context, HOME_ROUTE, (Route<dynamic> route) => false);
          }
          if (state is InvalidResponse) {
            Navigator.pushNamedAndRemoveUntil(
                context, CREATE_PARCEL_ROUTE, (Route<dynamic> route) => false);
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
        child: BlocBuilder<CreateParcelCubit, CreateParcelState>(
          builder: (context, state) {
            if (state is! PostmachinesLoaded) {
              return const Center(
                  child: CircularProgressIndicator(color: Colors.brown));
            }

            final postmachines = (state).postmachines;

            return Center(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 1000,
                  child: CreateParcelForm(
                    postmachines: postmachines,
                    size: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
