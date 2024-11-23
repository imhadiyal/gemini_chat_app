import 'package:flutter/material.dart';
import 'package:gemini_ai/Screen/home_page.dart';
import 'package:gemini_ai/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Routes.routes.route,
    );
  }
}
