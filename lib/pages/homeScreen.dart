// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_box/constans/colors.dart';
import 'package:post_box/constans/strings.dart';
import 'package:post_box/cubit/incoming_parcels_cubit.dart';
import 'package:post_box/data/models/parcel_showcase.dart';
import 'package:post_box/graphic/templates/home_page_template.dart';
import 'package:post_box/utils/userSharedPreferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ParcelsCubit>(context).fetchParcels();
    //BlocProvider.of<IncomingParcelsCubit>(context).fetchSendingParcels();

    return HomePageTemplate(
      title: "Post Box",
      body: [
        incomingPage(),
        sendingPage(),
      ],
    );
  }

  Widget incomingPage() => BlocBuilder<ParcelsCubit, ParcelsState>(
        builder: (context, state) {
          if (state is! ParcelsLoaded) {
            return Center(
              child: CircularProgressIndicator(color: Colors.brown[300]),
            );
          }

          final incomParcelSchowcase = (state).incomParcelSchowcase;

          if (!(incomParcelSchowcase == null)) {
            return SingleChildScrollView(
              child: Column(
                children: incomParcelSchowcase
                    .map((e) => _Parcels(e, context, "Sender", true))
                    .toList(),
              ),
            );
          } else {
            return Container();
          }
        },
      );

  Widget sendingPage() => BlocBuilder<ParcelsCubit, ParcelsState>(
        builder: (context, state) {
          if (state is! ParcelsLoaded) {
            return Center(
              child: CircularProgressIndicator(color: Colors.brown[300]),
            );
          }

          final sendParcelSchowcase = (state).sendParcelSchowcase;

          if (!(sendParcelSchowcase == null)) {
            return SingleChildScrollView(
              child: Column(
                children: sendParcelSchowcase
                    .map((e) => _Parcels(e, context, "Receiver", false))
                    .toList(),
              ),
            );
          } else {
            return Container();
          }
        },
      );

  Widget _Parcels(ParcelShowcase parcel, BuildContext context, String fromTo,
      bool isSender) {
    return InkWell(
      onTap: () {
        UserSharedPreferences.setParcelUuid(parcel.parcelNum!);
        Navigator.pushNamed(context, PARCEL_ROUTE);
      },
      child: Column(
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
                          Text("Parcel name", style: headerTextStyle()),
                          const Spacer(),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            parcel.parcelName!,
                            style: bodyTextStyle(),
                          ),
                          const Spacer(),
                        ],
                      )
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
                          Text(fromTo, style: headerTextStyle()),
                          const Spacer(),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            isSender ? parcel.sender! : parcel.receiver!,
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
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
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
