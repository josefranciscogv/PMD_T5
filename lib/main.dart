import 'package:flutter/material.dart';
import 'package:forage_app/home_page.dart';
import 'package:forage_app/providers/forage_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ForageProvider>(
    create: (context) => ForageProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}
