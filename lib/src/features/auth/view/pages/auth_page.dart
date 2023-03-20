import 'package:flutter/material.dart';
import 'package:macros/src/features/auth/view/components/login_text_field.dart';

import '../components/login_button.dart';
import '../components/to_signup_button.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
              child: Column(
                children: const [
                  LoginInputs(),
                  LoginButton(),
                  ToSignupButton(),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}


