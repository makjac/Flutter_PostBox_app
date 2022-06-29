// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, must_be_immutable
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:post_box/constans/colors.dart';
import 'package:post_box/cubit/parcel_history_cubit.dart';
import 'package:post_box/data/models/parcel_destination.dart';
import 'package:post_box/data/models/parcel_history.dart';
import 'package:post_box/graphic/templates/logged_page_template.dart';
import 'package:post_box/utils/utils_base.dart';

class ParcelHistoryPage extends StatelessWidget {
  String? uuid = UserSharedPreferences.getParcelUuid();
  ParcelHistoryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ParcelHistoryCubit>(context).fetchParcels(uuid!);
    return LoggedPageTemplate(
      title: "Parcel history",
      body: BlocBuilder<ParcelHistoryCubit, ParcelHistoryState>(
        builder: (context, state) {
          if (state is! ParcelsLoaded) {
            return Center(
              child: CircularProgressIndicator(color: Colors.brown[300]),
            );
          }

          final parcelHistorySchowcase = (state).parcelHistorySchowcase;
          final parcelDestinationSchowcase = (state).parcelDestinationSchowcase;

          return _body(parcelHistorySchowcase, parcelDestinationSchowcase);
        },
      ),
    );
  }

  Widget _body(List<ParcelHistory>? parcelHistorySchowcase,
      List<ParcelDestination>? parcelDestinationSchowcase) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Container(
          decoration: _ParcelDestDecoration(),
          child: Column(
            children: parcelDestinationSchowcase!.map((e) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Destination",
                          style: _headerStyle(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          e.pmZipcode!.trim().substring(0, 2) +
                              "-" +
                              e.pmZipcode!.trim().substring(2, 5) +
                              " ",
                          style: _adresStyle(),
                        ),
                        Text(
                          e.pmCity!.trim(),
                          style: _adresStyle(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          e.pmStreet!.trim(),
                          style: _adresStyle(),
                        ),
                        Text(
                          e.pmBuldingnum!.trim(),
                          style: _adresStyle(),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 10),
        Column(
          children: parcelDestinationSchowcase.map((e) {
            return Container();
          }).toList(),
        ),
        Column(
          children: parcelHistorySchowcase!.map((e) {
            return Container(
              decoration: _historyDecoration(),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(children: [
                  Icon(
                    Icons.check_box,
                    color: Colors.brown[600],
                  ),
                  const SizedBox(width: 10),
                  Text(
                    e.parcelStatus!.trim(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[900]),
                  ),
                ]),
              ),
            );
          }).toList(),
        )
      ],
    );
  }

  _adresStyle() => const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);

  _headerStyle() => const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 181, 181, 181));

  BoxDecoration _ParcelDestDecoration() {
    return BoxDecoration(
      color: Colors.brown[800],
    );
  }

  BoxDecoration _historyDecoration() {
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
}
