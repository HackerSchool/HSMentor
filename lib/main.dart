import 'package:flutter/material.dart';
import 'package:hsmentor/pages/pagina_principal.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:hsmentor/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final onboarding = prefs.getBool("onboarding") ?? false;

  runApp(MyApp(
    onboarding: onboarding,
  ));
}

class MyApp extends StatelessWidget {
  final bool onboarding;
  const MyApp({super.key, required this.onboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: onboarding ? PaginaPrincipal() : OnBoardingScreen(),
    );
  }
}
