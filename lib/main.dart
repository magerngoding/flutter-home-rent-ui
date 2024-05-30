import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_rent_ui/pages/detail_page.dart';
import 'package:home_rent_ui/pages/menu_page.dart';

import 'models/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffFAFAFA),
        textTheme: GoogleFonts.ralewayTextTheme(),
      ),
      home: MenuPage(),
      routes: {
        '/detail': (context) {
          Home home = ModalRoute.of(context)!.settings.arguments as Home;
          return DetailPage(home: home);
        }
      },
    );
  }
}
