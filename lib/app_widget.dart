import 'package:flutter/material.dart';
import 'package:macros/src/features/auth/controller/auth_controller.dart';
import 'package:macros/src/features/auth/controller/input_controller.dart';
import 'package:macros/src/features/auth/view/pages/auth_page.dart';
import 'package:macros/src/features/home/view/pages/home_page.dart';
import 'package:macros/src/splash_page.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (_) => InputController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          canvasColor: const Color(0xfff5f5f7),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.red,
            secondary: const Color(0xff0071E3),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              color: Colors.black,
            ),
            bodyLarge: TextStyle(
              color: Colors.black,
            ),
            labelLarge: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        initialRoute: SplashPage.routeName,
        routes: {
          SplashPage.routeName: (_) => SplashPage(),
          AuthPage.routeName: (_) => AuthPage(),
          HomePage.routeName: (_) => HomePage(),
        },
      ),
    );
  }
}
