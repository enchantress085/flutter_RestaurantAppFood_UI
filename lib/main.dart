import 'package:flutter/material.dart';
import 'package:food_app_ui/screens/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey.withOpacity(0.2),
          primaryColor: Colors.purple),
      home: HomePage(),
    );
  }
}
