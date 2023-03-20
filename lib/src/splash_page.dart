import 'package:flutter/material.dart';
import 'package:macros/src/features/auth/controller/auth_controller.dart';
import 'package:macros/src/features/auth/view/pages/auth_page.dart';
import 'package:macros/src/features/home/view/pages/home_page.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const routeName = '/';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    // await Future.delayed(const Duration(seconds: 1));

    final controller = context.read<AuthController>();

    controller.tryAutoLogin().then((res) {
      if (res) {
        Navigator.of(context).pushReplacementNamed(HomePage.routeName);
      } else {
        Navigator.of(context).pushReplacementNamed(AuthPage.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
