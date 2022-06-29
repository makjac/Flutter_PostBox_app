// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:post_box/constans/colors.dart';
import 'package:post_box/cubit/create_parcel_cubit.dart';
import 'package:post_box/data/models/postmachine_model.dart';

class CreateParcelForm extends StatefulWidget {
  final List<PostMachine>? postmachines;
  final double size;

  const CreateParcelForm({this.size = 0, required this.postmachines, Key? key})
      : super(key: key);

  @override
  State<CreateParcelForm> createState() => _CreateParcelFormState();
}

class _CreateParcelFormState extends State<CreateParcelForm> {
  final _formKey = GlobalKey<FormState>();

  final loginController = TextEditingController();

  final parcelNameController = TextEditingController();

  int rid = 0;

  int sid = 0;

  double formSize() {
    if (widget.size < 800) {
      return widget.size;
    } else {
      return 800;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: formSize(),
      child: Container(
        decoration: myBoxDecoration(),
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Form(
          autovalidateMode: AutovalidateMode.disabled,
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            child: Column(
              children: <Widget>[
                _label("Reciever login"),
                loginField(),
                //const SizedBox(height: 5),
                _label("Parcel name"),
                passwdField(),
                //const SizedBox(height: 5),
                _label("Reciever postmachine adres"),

                DropdownButtonFormField<int>(
                  onChanged: ((value) {
                    setState(() {
                      rid = value!;
                    });
                  }),
                  items: widget.postmachines?.map<DropdownMenuItem<int>>((pm) {
                    return DropdownMenuItem<int>(
                      child: Text(pm.toString()),
                      value: pm.id,
                    );
                  }).toList(),
                  validator: (value) =>
                      value == null ? "Select destination postmachine" : null,
                  dropdownColor: TEXT_FIELDS_FORM_COLOR,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: TEXT_FIELDS_FORM_COLOR,
                    prefixIcon: const Icon(Icons.add_home_rounded),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.brown, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),

                const SizedBox(height: 25),
                _label("Sender postmachine adres"),

                DropdownButtonFormField<int>(
                  onChanged: ((value) {
                    setState(() {
                      sid = value!;
                    });
                  }),
                  items: widget.postmachines?.map<DropdownMenuItem<int>>((pm) {
                    return DropdownMenuItem<int>(
                      child: Text(pm.toString()),
                      value: pm.id,
                    );
                  }).toList(),
                  validator: (value) =>
                      value == null ? "Select destination postmachine" : null,
                  dropdownColor: TEXT_FIELDS_FORM_COLOR,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: TEXT_FIELDS_FORM_COLOR,
                    prefixIcon: const Icon(Icons.add_home_rounded),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.brown, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    final isValid = _formKey.currentState!.validate();
                    if (isValid) {
                      final login = loginController.text;
                      final parcelName = parcelNameController.text;
                      BlocProvider.of<CreateParcelCubit>(context)
                          .createParcel(login, parcelName, rid, sid);
                    }
                  },
                  child: _addBut(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _label(String title) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[800]),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      );

  Widget _addBut() => Container(
      height: 40,
      width: 200,
      decoration: BoxDecoration(
        color: BUTTON_FORM_COLOR,
        borderRadius: BorderRadius.circular(10),
      ),
      child: BlocBuilder<CreateParcelCubit, CreateParcelState>(
        builder: (context, state) {
          if (state is CreatingParcel) {
            return CircularProgressIndicator(color: Colors.brown[100]);
          }
          return const Center(
            child: Text("Create",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          );
        },
      ));

  Widget loginField() => TextFormField(
        decoration: const InputDecoration(
          fillColor: TEXT_FIELDS_FORM_COLOR,
          filled: true,
          label: Text('Reciever username'),
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(),
        ),
        controller: loginController,
        maxLength: 30,
        maxLines: 1,
        validator: ValidationBuilder().required().build(),
      );

  Widget passwdField() => TextFormField(
        decoration: const InputDecoration(
          fillColor: TEXT_FIELDS_FORM_COLOR,
          filled: true,
          label: Text('Parcel name'),
          prefixIcon: Icon(Icons.rectangle),
          border: OutlineInputBorder(),
        ),
        controller: parcelNameController,
        keyboardType: TextInputType.visiblePassword,
        maxLength: 100,
        maxLines: 1,
      );

  Widget postmachineList(int id) {
    return DropdownButtonFormField<int>(
      onChanged: ((value) {
        id = value!;
      }),
      items: widget.postmachines?.map<DropdownMenuItem<int>>((pm) {
        return DropdownMenuItem<int>(
          child: Text(pm.toString()),
          value: pm.id,
        );
      }).toList(),
      validator: (value) =>
          value == null ? "Select destination postmachine" : null,
      dropdownColor: TEXT_FIELDS_FORM_COLOR,
      decoration: InputDecoration(
        filled: true,
        fillColor: TEXT_FIELDS_FORM_COLOR,
        prefixIcon: const Icon(Icons.add_home_rounded),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.brown, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  BoxDecoration myBoxDecoration() {
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
}
