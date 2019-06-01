import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthService {
  Stream<ResultStream> get onAuthStateChanged;
}

class ResultStream {
  String data;
  bool error;
  FirebaseUser user;

  ResultStream({
    this.user,
    this.error
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
      print(user.email);
      Future.delayed(const Duration(seconds: 2), () => _onAuthStateChangedController.add(ResultStream(user: user, error: false)));

    } else {
      _onAuthStateChangedController.add(ResultStream(user: null, error: true));
    }
  }

  void setup() {

    _signInWithEmailAndPassword();

  }

  void dispose() {
    _onAuthStateChangedController.close();
  }


}