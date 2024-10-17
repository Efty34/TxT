import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  
  // instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in
  Future<UserCredential> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // signup
  Future<UserCredential> signUpWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign out
  Future<void> signOut() async {
    return await _auth.signOut();
  }

  // isNewUser function
  Future<bool> isNewUser() async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      // Check if user creation time and last sign-in time are the same
      return currentUser.metadata.creationTime == currentUser.metadata.lastSignInTime;
    }
    return false; // If no user is logged in
  }

  // error handling
}