import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> register(String email, String password) async {
  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email.trim(), password: password);
  return true;
}
