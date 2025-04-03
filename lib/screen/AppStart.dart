

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopease/screen/IntroScreen.dart';
import 'package:shopease/screen/LandingPage.dart';
import 'package:shopease/screen/SplashScreen.dart';

class AppStart  extends StatefulWidget {
  const AppStart ({super.key});

  @override
  State<AppStart> createState() => _AppStartState();
}

class _AppStartState extends State<AppStart> {

  @override
  void initState(){
    super.initState();
    _checkFirstLaunch();
  }
  Future<void> _checkFirstLaunch()async{
    final prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('isFirstLaunch')?? true;

    if(isFirstLaunch){
      prefs.setBool('isFirstLaunch', false);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const IntroScreen()));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SplashScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SizedBox.shrink(),);
  }
}
