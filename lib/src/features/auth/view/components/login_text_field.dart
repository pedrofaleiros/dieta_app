import 'package:flutter/material.dart';
import 'package:macros/src/features/auth/controller/auth_controller.dart';
import 'package:macros/src/features/auth/controller/input_controller.dart';
import 'package:provider/provider.dart';

enum FormType { email, password }

class LoginInputs extends StatelessWidget {
  const LoginInputs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        LoginTextField(
          formType: FormType.email,
        ),
        SizedBox(height: 20),
        LoginTextField(
          formType: FormType.password,
        ),
      ],
    );
  }
}

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    super.key,
    required this.formType,
  });

  final FormType formType;

  void _requestFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InputController>(
      builder: (_, inputController, ch) => TextField(
        focusNode: formType == FormType.password
            ? inputController.passwordFocusNode
            : null,
        obscureText: formType == FormType.password,
        style: Theme.of(context).textTheme.bodyLarge,
        onEditingComplete: formType == FormType.password
            ? () => FocusScope.of(context).requestFocus(FocusNode())
            : () => _requestFocus(context, inputController.passwordFocusNode),
        onChanged: (value) {
          if (formType == FormType.email) {
            // auth.authRequest = auth.authRequest.copyWith(email: value);
            inputController.email = value;
          } else {
            // auth.authRequest = auth.authRequest.copyWith(password: value);
            inputController.password = value;
          }
        },
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          labelText: formType == FormType.email ? 'Email' : 'Password',
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 2,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
