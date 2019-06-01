import 'package:flutter/material.dart';
import 'package:servi/screens/landing_screen.dart';
import 'package:servi/screens/main_screen.dart';
import 'package:servi/service/auth_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyAppBloc());

//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Servi',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: MainScreen(),
//    );
//  }
//}

class MyAppBloc extends StatelessWidget {

  final AuthServiceImpl authServiceImpl = AuthServiceImpl();

  @override
  Widget build(BuildContext context) {
    return Provider<AuthService>(
      builder: (_) => authServiceImpl,
      dispose: (_, AuthService authService) => authServiceImpl.dispose(),
      child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.indigo,
          ),
          home: LandingPage(),
        ),
    );
  }
}
