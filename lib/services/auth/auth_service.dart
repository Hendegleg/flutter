import 'package:firebase_auth/firebase_auth.dart';
import '../../Utils.dart/AuthException.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  Future<UserCredential> signInWithEmailPassword(
      String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception("Veuillez remplir tous les champs.");
    }

    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Retourne les informations sur l'utilisateur connecté
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception("Ce compte n'existe pas - Inscrivez-vous.");
      } else if (e.code == 'invalid-credential') {
        throw Exception("Informations d'identification invalides.");
      } else {
        throw Exception(e.code);
      }
    }
  }

  Future<UserCredential> signUpWithEmailPassword(
      String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception("Veuillez remplir tous les champs.");
    }

    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
