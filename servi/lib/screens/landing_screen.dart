
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servi/service/auth_service.dart';
import 'main_screen.dart';


/// A widget that does not require mutable state.
class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    /// Creates a new instance of the [AuthService]
    /// to handle the change state of the Cloud Firebase
    final AuthService auth = Provider.of<AuthService>(context, listen: false);

    /// Creates a new [StreamBuilder] that builds itself based on the latest
    /// snapshot of interaction with the specified [stream] and whose build
    /// strategy is given by [builder].
    ///
    /// The [initialData] is used to create the initial snapshot.
    ///
    /// The [builder] must not be null.

    return StreamBuilder<ResultStream>(
      stream: auth.onAuthStateChanged,
      builder: (_, AsyncSnapshot<ResultStream> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final ResultStream result = snapshot.data;
          if (result.user != null && !result.error) {
            return MainScreen();
          }
          else if (result.user == null && result.error) {
            return Text("Signup not implemented!");
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