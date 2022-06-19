// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:post_box/graphic/colors.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Container(
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
                    primary: buttonFormColor,
                    minimumSize: const Size(200, 40),
                  ),
                  onPressed: () {
                    final isValid = _formKey.currentState!.validate();
                    if (isValid) {}
                  },
                  child: const Text("Register"),
                ),
              ],
            ),
          ),
        ),
      );
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    color: backgroundFormColor,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(
      width: 4,
      color: borderFormColor,
    ),
    boxShadow: const [
      BoxShadow(
        color: shadowFormColor,
        blurRadius: 10,
      ),
    ],
  );
}

Widget buildFirstName() => TextFormField(
      decoration: const InputDecoration(
        fillColor: textFieldsFormColor,
        filled: true,
        label: Text('First name'),
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.name,
      maxLength: 30,
      maxLines: 1,
      validator: ValidationBuilder().minLength(2).build(),
    );

Widget buildLastName() => TextFormField(
      decoration: const InputDecoration(
        fillColor: textFieldsFormColor,
        filled: true,
        label: Text('Last name'),
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(),
      ),
      maxLength: 40,
      maxLines: 1,
      validator: ValidationBuilder().minLength(2).build(),
    );

Widget buildPhone() => TextFormField(
      decoration: const InputDecoration(
        fillColor: textFieldsFormColor,
        filled: true,
        label: Text('Phone number'),
        prefixIcon: Icon(Icons.phone),
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.phone,
      maxLength: 12,
      maxLines: 1,
      validator: ValidationBuilder().phone().build(),
    );

Widget buildEmail() => TextFormField(
      decoration: const InputDecoration(
        fillColor: textFieldsFormColor,
        filled: true,
        label: Text('Email'),
        hintText: 'name@example.com',
        prefixIcon: Icon(Icons.email_outlined),
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
      maxLength: 40,
      maxLines: 1,
      validator: ValidationBuilder().email().build(),
    );

Widget buildLogin() => TextFormField(
      decoration: const InputDecoration(
        fillColor: textFieldsFormColor,
        filled: true,
        label: Text('Login'),
        prefixIcon: Icon(Icons.login),
        border: OutlineInputBorder(),
      ),
      maxLength: 30,
      maxLines: 1,
      validator: ValidationBuilder().required().build(),
    );

Widget buildPasswd() => TextFormField(
      decoration: const InputDecoration(
        fillColor: textFieldsFormColor,
        filled: true,
        label: Text('Password'),
        prefixIcon: Icon(Icons.password),
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      maxLength: 100,
      maxLines: 1,
      validator: ValidationBuilder().minLength(6).build(),
    );
