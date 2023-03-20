import 'package:flutter/material.dart';
import 'package:macros/src/features/auth/controller/input_controller.dart';
import 'package:provider/provider.dart';

import '../../controller/auth_controller.dart';
import '../../../home/view/pages/home_page.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({
    super.key,
  });

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  // bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AuthController>();

    return Consumer<AuthController>(
      builder: (_, auth, child) => Column(
        children: [
          auth.errorText == null
              ? const SizedBox(height: 15)
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    auth.errorText!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.secondary,
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            onPressed: controller.isLoading
                ? null
                : () async {
                    final input = context.read<InputController>();

                    auth
                        .login(
                      email: input.email.replaceAll(' ', ''),
                      password: input.password.replaceAll(' ', ''),
                    )
                        .then((value) {
                      if (value) {
                        Navigator.of(context)
                            .pushReplacementNamed(HomePage.routeName);
                      }
                    }).catchError((onError) {});
                  },
            child: controller.isLoading
                ? const SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
