import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid Tracker',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme, // Access the default text theme
        ).copyWith(
          // Use the text styles from GoogleFonts.latoTextTheme
          bodyLarge: GoogleFonts.oswald(textStyle: TextStyle(fontSize: 16)),
          // You can customize other text styles here
        ),
      ),
      home: SplashScreen(),
    );
  }
}
