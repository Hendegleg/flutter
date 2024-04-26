import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_application_1/services/auth/auth_gate.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: LottieBuilder.asset("lib/Lottie/animation.json"),
            ),
            Center(
              child: Text(
                'KOOL EXPRESS',
                style: TextStyle(
                  fontSize: 24, // Adjust the font size as needed
                  fontWeight:
                      FontWeight.bold, // Adjust the font weight as needed
                  color: Color.fromARGB(
                      255, 213, 171, 16), // Adjust the text color as needed
                ),
              ),
            ),
          ],
        ),
      ),
      nextScreen: AuthGate(),
      splashIconSize: 400,
      backgroundColor: const Color.fromARGB(255, 203, 222, 255),
    );
  }
}
