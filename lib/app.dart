import 'package:flutter/material.dart';
import 'package:hostel_management/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[50],
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          hintStyle: TextStyle(color: Colors.grey[500]),
          filled: true,
          fillColor: Colors.grey[300],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          prefixIconColor: Colors.grey[500],
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[50],
          foregroundColor: Colors.black,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            // minimumSize: const Size.fromHeight(44),

            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
