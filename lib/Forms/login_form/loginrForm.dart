// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:post_box/constans/colors.dart';
import 'package:post_box/cubit/login_cubit.dart';

class LoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final loginController = TextEditingController();
  final passwdController = TextEditingController();
  final double size;

  LoginForm({this.size = 0, Key? key}) : super(key: key);

  double formSize() {
    if (size < 800) {
      return size;
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
                loginField(),
                const SizedBox(height: 15),
                passwdField(),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    final isValid = _formKey.currentState!.validate();
                    if (isValid) {
                      final login = loginController.text;
                      final passwd = passwdController.text;
                      BlocProvider.of<LoginCubit>(context)
                          .loginUser(login, passwd);
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

  Widget _addBut() => Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: BUTTON_FORM_COLOR,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: BlocBuilder<LoginCubit, LoginState>(
          builder: ((context, state) {
            if (state is ProcessingLogin) {
              return CircularProgressIndicator(color: Colors.brown[100]);
            }
            return const Text("Login",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold));
          }),
        )),
      );

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

  Widget loginField() => TextFormField(
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

  Widget passwdField() => TextFormField(
        decoration: const InputDecoration(
          fillColor: TEXT_FIELDS_FORM_COLOR,
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
      );
}
