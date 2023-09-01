import 'package:bootcamp_flutter/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: GoogleFonts.openSansTextTheme()
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
