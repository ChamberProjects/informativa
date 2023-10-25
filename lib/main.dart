import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:informativa/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Informativa App',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 3, color: Colors.purple),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 3, color: Colors.purple),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
      textTheme: GoogleFonts.puritanTextTheme(),
      scaffoldBackgroundColor: Colors.deepPurple[100],
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
