import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shopease/provider/AuthProvider.dart';
import 'package:shopease/screen/Homepage.dart';
import 'package:shopease/screen/LandingPage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return AnimatedSplashScreen(
        splash: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/images/animation.json',
                  height: MediaQuery.of(context).size.height * .06,
                  fit: BoxFit.contain),
              Text(
                "ShopEase",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
        duration: 3000,
        curve: Curves.bounceOut,
        splashTransition: SplashTransition.sizeTransition,
        nextScreen: authProvider.isLoggedIn ? const Homepage() : LandingPage());
  }
}
