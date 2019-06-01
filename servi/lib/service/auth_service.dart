import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthService {
  Stream<ResultStream> get onAuthStateChanged;
}

class ResultStream {
  String data;

  FirebaseUser user;

  ResultStream({
    this.user
});
}

enum AuthServiceType { FIREBASE }

class AuthServiceImpl implements AuthService {

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthServiceImpl() {
    setup();
  }
  AuthServiceType authServiceType = AuthServiceType.FIREBASE;

  AuthServiceType get authService => authServiceType;

  final StreamController<ResultStream> _onAuthStateChangedController = StreamController<ResultStream>();

  @override
  Stream<ResultStream> get onAuthStateChanged => _onAuthStateChangedController.stream;

  void _signInWithEmailAndPassword() async {
    final FirebaseUser user = await _auth.signInWithEmailAndPassword(
      email: "daniel@dengun.com",
      password: "123456",
    );
    if (user != null) {

      Future.delayed(const Duration(seconds: 5), () =>
          _onAuthStateChangedController.add(ResultStream(user: user))
      );



      print(user.email);
//      setState(() {
//        _success = true;
//        _userEmail = user.email;
//      });
    } else {
//      _success = false;
    }
  }

  void setup() {

    _signInWithEmailAndPassword();



  }

  void dispose() {
    _onAuthStateChangedController.close();
  }


}