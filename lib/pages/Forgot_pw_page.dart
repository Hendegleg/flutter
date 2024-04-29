import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils.dart/AuthException.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String id = 'reset_password';
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  static final auth = FirebaseAuth.instance;
  static late AuthStatus _status;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<AuthStatus> resetPassword({required String email}) async {
    await auth
        .sendPasswordResetEmail(email: email)
        .then((value) => _status = AuthStatus.successful)
        .catchError(
            (e) => _status = AuthExceptionHandler.handleAuthException(e));

    return _status;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 50.0, bottom: 25.0),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, color: Color.fromARGB(255, 240, 205, 63)),
                ),
                const SizedBox(height: 70),
                const Text(
                  "Mot de passe oublié",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Veuillez entrer votre addresse email pour réinitialiser votre mot de passe.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Adresse email',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  child: TextFormField(
                    obscureText: false,
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email vide';
                      }
                      return null;
                    },
                    autofocus: false,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            30.0,
                          ),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            30.0,
                          ),
                        ),
                      ),
                      isDense: true,
                      filled: true,
                      errorStyle: TextStyle(fontSize: 15),
                      hintText: 'Adresse email',
                      prefixIcon: Icon(Icons.email, color: Colors.grey),
                      hintStyle: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 47, 47, 47)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Expanded(child: SizedBox()),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).colorScheme.secondary,
                    child: MaterialButton(
                      onPressed: () async {
                        if (_key.currentState!.validate()) {
                          try {
                            final credential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: _emailController.text.trim(),
                              password: "testtttttttttttttt",
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Échec de la réinitialisation du mot de passe. Veuillez vérifier votre e-mail.'),
                              ),
                            );
                            await FirebaseAuth.instance.currentUser!.delete();
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'email-already-in-use') {
                              await auth.sendPasswordResetEmail(
                                  email: _emailController.text.trim());
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Un e-mail de réinitialisation a été envoyé à ${_emailController.text.trim()}'),
                                ),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Échec de la réinitialisation du mot de passe. Veuillez vérifier votre e-mail.'),
                              ),
                            );
                          }
                        }
                      },
                      minWidth: double.infinity,
                      child: const Text(
                        'Réinitialiser Mot de passe',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
