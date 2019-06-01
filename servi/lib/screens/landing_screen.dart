


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servi/service/auth_service.dart';

import 'main_screen.dart';

class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of<AuthService>(context, listen: false);

    print(auth.onAuthStateChanged);

    return StreamBuilder<ResultStream>(
      stream: auth.onAuthStateChanged,
      builder: (_, AsyncSnapshot<ResultStream> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final ResultStream result = snapshot.data;
          if (result.user != null) {
            return MainScreen();
          }
        }

        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}