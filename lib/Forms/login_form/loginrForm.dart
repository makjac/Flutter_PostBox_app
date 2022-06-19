// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class LoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController loginController;
  final TextEditingController passwdController;
  final VoidCallback funcHandler;
  final double size;

  LoginForm(
      {required this.loginController,
      required this.passwdController,
      required this.funcHandler,
      this.size = 0,
      Key? key})
      : super(key: key);

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
                  buildLogin(),
                  const SizedBox(height: 15),
                  buildPasswd(),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown[700],
                      minimumSize: const Size(200, 40),
                    ),
                    //onPressed: funcHandler,
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
        ),
      );

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      color: Colors.brown[200],
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        width: 4,
        color: Colors.brown,
      ),
      boxShadow: const [
        BoxShadow(
          color: Colors.brown,
          blurRadius: 10,
        ),
      ],
    );
  }

  Widget buildLogin() => TextFormField(
        decoration: const InputDecoration(
          fillColor: Color.fromARGB(179, 255, 255, 255),
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
          fillColor: Color.fromARGB(179, 255, 255, 255),
          filled: true,
          label: Text('Password'),
          prefixIcon: Icon(Icons.password),
          border: OutlineInputBorder(),
        ),
        controller: passwdController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        maxLength: 100,
        maxLines: 1,
        validator: ValidationBuilder().minLength(6).build(),
      );
}
