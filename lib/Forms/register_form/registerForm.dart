// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:post_box/constans/colors.dart';
import 'package:post_box/cubit/register_cubit.dart';
import 'package:post_box/data/models/register_model.dart';

class RegisterForm extends StatelessWidget {
  final loginController = TextEditingController();
  final passwdController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final double size;

  RegisterForm({this.size = 0, Key? key}) : super(key: key);

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
                const SizedBox(height: 15),
                buildLogin(),
                const SizedBox(height: 15),
                buildPasswd(),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    final isValid = _formKey.currentState!.validate();
                    if (isValid) {
                      BlocProvider.of<RegisterCubit>(context)
                          .RegisterUser(RegisterModel(
                        login: loginController.text,
                        passwd: passwdController.text,
                        name: nameController.text,
                        surname: surnameController.text,
                        phone: phoneController.text,
                        email: emailController.text,
                      ));
                    }
                  },
                  child: _addBut(),
                )
              ],
            ),
          ),
        ),
      ));

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

  Widget buildLogin() => TextFormField(
        decoration: const InputDecoration(
          fillColor: TEXT_FIELDS_FORM_COLOR,
          filled: true,
          label: Text('Login'),
          prefixIcon: Icon(Icons.login),
          border: OutlineInputBorder(),
        ),
        controller: loginController,
        maxLength: 30,
        maxLines: 1,
        validator: ValidationBuilder().required().build(),
      );

  Widget buildPasswd() => TextFormField(
        decoration: const InputDecoration(
          fillColor: TEXT_FIELDS_FORM_COLOR,
          filled: true,
          label: Text('Password'),
          prefixIcon: Icon(Icons.password),
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.visiblePassword,
        controller: passwdController,
        obscureText: true,
        maxLength: 100,
        maxLines: 1,
        validator: ValidationBuilder().minLength(6).build(),
      );

  Widget _addBut() => Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: BUTTON_FORM_COLOR,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: BlocBuilder<RegisterCubit, RegisterState>(
          builder: ((context, state) {
            if (state is ProcessingRegister) {
              return CircularProgressIndicator(color: Colors.brown[100]);
            }
            return const Text("Register",
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
