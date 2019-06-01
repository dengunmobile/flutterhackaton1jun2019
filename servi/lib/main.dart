import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servi/screens/event_detail_screen.dart';
import 'package:servi/screens/landing_screen.dart';
import 'package:servi/service/auth_service.dart';


void main() => runApp(MyAppBloc());


class MyAppBloc extends StatelessWidget {

  final AuthServiceImpl authServiceImpl = AuthServiceImpl();

  @override
  Widget build(BuildContext context) {

    /// Create Provider to handle the auth state when authenticate
    /// using an user registered on Cloud Firebase
    ///
    /// Implements [AuthService]
    /// loads [LoadingPage] widget

    return Provider<AuthService>(
      builder: (_) => authServiceImpl,
      dispose: (_, AuthService authService) => authServiceImpl.dispose(),
      child: MaterialApp(
          title: 'Servi',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          initialRoute: "/",
          routes: {
            "/": (context) => LandingPage(),
            "/details" : (context) => EventDetailScreen()
          }
        ),
    );
  }
}
