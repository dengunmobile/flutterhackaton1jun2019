import 'package:flutter/material.dart';
import 'package:servi/screens/event_detail_screen.dart';
import 'package:servi/screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Servi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => MainScreen(),
        "/details" : (context) => EventDetailScreen()

      },
    );
  }
}
