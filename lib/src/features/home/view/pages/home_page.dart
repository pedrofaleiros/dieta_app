import 'package:flutter/material.dart';
import 'package:macros/src/features/auth/controller/auth_controller.dart';
import 'package:macros/src/features/auth/view/pages/auth_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            final controller =
                Provider.of<AuthController>(context, listen: false);

            await controller.logout().then((value) {
              if (value) {
                Navigator.of(context).pushReplacementNamed(AuthPage.routeName);
              }
            });
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: Text('load'),
        ),
      ),
    );
  }
}
