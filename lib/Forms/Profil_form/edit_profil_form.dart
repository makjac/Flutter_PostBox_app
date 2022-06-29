// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:post_box/constans/colors.dart';
import 'package:post_box/cubit/edit_profile_cubit.dart';
import 'package:post_box/utils/userSharedPreferences.dart';

class EditProfilForm extends StatelessWidget {
  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  final double size;

  EditProfilForm({this.size = 0, Key? key}) : super(key: key) {
    nameController =
        TextEditingController(text: UserSharedPreferences.getName());
    surnameController =
        TextEditingController(text: UserSharedPreferences.getSurname());
    phoneController =
        TextEditingController(text: UserSharedPreferences.getPhone());
    emailController =
        TextEditingController(text: UserSharedPreferences.getEmail());
  }

  final _formKey = GlobalKey<FormState>();

  double formSize() {
    if (size < 800) {
      return size;
    } else {
      return 800;
    }
  }

  @override
  Widget build(BuildContext context) => SizedBox(
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
                  buildFirstName(),
                  const SizedBox(height: 15),
                  buildLastName(),
                  const SizedBox(height: 15),
                  buildPhone(),
                  const SizedBox(height: 15),
                  buildEmail(),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      final isValid = _formKey.currentState!.validate();
                      if (isValid) {
                        BlocProvider.of<EditProfileCubit>(context)
                            .updatePrifile(
                          1,
                          nameController.text,
                          surnameController.text,
                          phoneController.text,
                          emailController.text,
                        );
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

  Widget buildFirstName() => TextFormField(
        decoration: const InputDecoration(
          fillColor: TEXT_FIELDS_FORM_COLOR,
          filled: true,
          label: Text('First name'),
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(),
        ),
        controller: nameController,
        keyboardType: TextInputType.name,
        maxLength: 30,
        maxLines: 1,
        validator: ValidationBuilder().minLength(2).build(),
      );

  Widget buildLastName() => TextFormField(
        decoration: const InputDecoration(
          fillColor: TEXT_FIELDS_FORM_COLOR,
          filled: true,
          label: Text('Last name'),
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(),
        ),
        controller: surnameController,
        maxLength: 40,
        maxLines: 1,
        validator: ValidationBuilder().minLength(2).build(),
      );

  Widget buildPhone() => TextFormField(
        decoration: const InputDecoration(
          fillColor: TEXT_FIELDS_FORM_COLOR,
          filled: true,
          label: Text('Phone number'),
          prefixIcon: Icon(Icons.phone),
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.phone,
        controller: phoneController,
        maxLength: 12,
        maxLines: 1,
        validator: ValidationBuilder().phone().build(),
      );

  Widget buildEmail() => TextFormField(
        decoration: const InputDecoration(
          fillColor: TEXT_FIELDS_FORM_COLOR,
          filled: true,
          label: Text('Email'),
          hintText: 'name@example.com',
          prefixIcon: Icon(Icons.email_outlined),
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.emailAddress,
        controller: emailController,
        maxLength: 40,
        maxLines: 1,
        validator: ValidationBuilder().email().build(),
      );

  Widget _addBut() => Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: BUTTON_FORM_COLOR,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: BlocBuilder<EditProfileCubit, EditProfileState>(
          builder: ((context, state) {
            if (state is UpdatingProfile) {
              return CircularProgressIndicator(color: Colors.brown[100]);
            }
            return const Text("Update profile",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold));
          }),
        )),
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
