// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_box/constans/colors.dart';
import 'package:post_box/cubit/incoming_parcels_cubit.dart';
import 'package:post_box/data/models/parcel_showcase.dart';
import 'package:post_box/graphic/templates/home_page_template.dart';
import 'package:post_box/graphic/templates/logged_page_template.dart';
import 'package:post_box/graphic/templates/page_template.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<IncomingParcelsCubit>(context).fetchIncomingParcels();

    return HomePageTemplate(
      title: "Post Box",
      body: [
        BlocBuilder<IncomingParcelsCubit, IncomingParcelsState>(
          builder: (context, state) {
            if (state is! IncomParcelsLoaded) {
              return Center(
                child: CircularProgressIndicator(color: Colors.brown[300]),
              );
            }

            final parcelSchowcase = (state).parcelSchowcase;

            if (!(parcelSchowcase == null)) {
              return SingleChildScrollView(
                child: Column(
                  children: parcelSchowcase
                      .map((e) => _incomParcels(e, context))
                      .toList(),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
        Container(),
      ],
    );
  }

  Widget _incomParcels(ParcelShowcase parcel, BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 10),
        Container(
          decoration: ParcelDecoration(),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Parcel num",
                          style: headerTextStyle(),
                        ),
                        const Spacer(),
                        const Icon(Icons.rectangle_outlined)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          parcel.parcelNum!,
                          style: bodyTextStyle(),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Sender", style: headerTextStyle()),
                        const Spacer(),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          parcel.sender!,
                          style: bodyTextStyle(),
                        ),
                        const Spacer(),
                        Text(
                          "more",
                          style: bodyTextStyle(),
                        ),
                        const Icon(Icons.arrow_right_alt_rounded),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  headerTextStyle() => TextStyle(
      color: Colors.brown[400], fontWeight: FontWeight.bold, fontSize: 15);

  bodyTextStyle() => TextStyle(
      color: Colors.brown[700], fontWeight: FontWeight.bold, fontSize: 15);

  BoxDecoration ParcelDecoration() {
    return const BoxDecoration(
      color: BACKGROUND_FORM_COLOR,
    );
  }
}
