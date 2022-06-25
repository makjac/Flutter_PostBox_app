// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:post_box/constans/colors.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController loginController;
  final TextEditingController passwdController;
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final VoidCallback funcHandler;
  final double size;

  RegisterForm(
      {required this.loginController,
      required this.passwdController,
      required this.nameController,
      required this.surnameController,
      required this.phoneController,
      required this.emailController,
      required this.funcHandler,
      this.size = 0,
      Key? key})
      : super(key: key);

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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: BUTTON_FORM_COLOR,
                    minimumSize: const Size(200, 40),
                  ),
                  onPressed: () {
                    final isValid = _formKey.currentState!.validate();
                    if (isValid) {
                      funcHandler();
                    }
                  },
                  child: const Text("Register"),
                ),
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
        keyboardType: TextInputType.name,
        //controller: nameController,
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
