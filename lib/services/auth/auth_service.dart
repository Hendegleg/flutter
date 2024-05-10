import 'package:firebase_auth/firebase_auth.dart';

enum AuthStatus {
  successful,
  wrongPassword,
  emailAlreadyExists,
  invalidEmail,
  weakPassword,
  invalid_credential,
  unknown,
}


class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  static String generateErrorMessage(error) {
    String errorMessage;
    switch (error) {
      case AuthStatus.invalidEmail:
        errorMessage = "Veuillez saisir une adresse valide.";
        break;
      case AuthStatus.invalid_credential:
        errorMessage = "Données invalides. Vérifiez les!";
        break;
      case AuthStatus.weakPassword:
        errorMessage = "Votre mot de passe doit contenir au moins 6 caracteres.";
        break;
      case AuthStatus.wrongPassword:
        errorMessage = "Vos données sont invalides.";
        break;
      case AuthStatus.emailAlreadyExists:
        errorMessage =
            "L'addresse est déja utilisée par un autre compte.";
        break;
      default:
        errorMessage = "Une erreur s'est produite. Réessayez ulterieurement.";
    }
    return errorMessage;
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
      switch (e.code) {
        case 'user-not-found':
          throw Exception("Ce compte n'existe pas - Inscrivez-vous.");
        case 'invalid-credential':
          throw Exception(generateErrorMessage(AuthStatus.invalid_credential));
        case 'invalid-email':
          throw Exception(generateErrorMessage(AuthStatus.invalidEmail));
        case 'wrong-password':
          throw Exception(generateErrorMessage(AuthStatus.wrongPassword));
        default:
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
      switch (e.code) {
        case 'email-already-in-use':
          throw Exception(generateErrorMessage(AuthStatus.emailAlreadyExists));
        default:
          throw Exception(e.code);
      }
    }
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}