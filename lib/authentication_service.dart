import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_flutter_app/globals.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      currentUserEmail = _firebaseAuth.currentUser.email;
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      currentUserEmail = _firebaseAuth.currentUser.email;
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

}