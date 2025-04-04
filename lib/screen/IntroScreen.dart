import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shopease/screen/LandingPage.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[

          IntroductionScreen(
          pages: [
            PageViewModel(
                decoration: PageDecoration(
                    titleTextStyle: const TextStyle(fontSize: 30),
                    fullScreen: true,
                    pageColor: Colors.greenAccent.withOpacity(0.5),
                    bodyPadding: const EdgeInsets.all(30),
                    titlePadding: const EdgeInsets.all(40)),
                title: 'Shop Smart, Live Better',
                body: 'Discover the best deals, top brands, and exclusive offers—all in one place. Your shopping, simplified!',
                image: Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*.1),
                    child: Image.asset('assets/images/intro1.png'),)),
            PageViewModel(
              decoration: PageDecoration(
                  titleTextStyle: const TextStyle(fontSize: 30),
                  fullScreen: true,
                  pageColor: Colors.purpleAccent.withOpacity(0.5),
                  bodyPadding: const EdgeInsets.all(30),
                  titlePadding: const EdgeInsets.all(40)),
              title: 'Your Cart, Your Style',
              body: 'Find products that match your vibe. From fashion to gadgets, we’ve got everything you need!',
              image: Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*.1),
                child: Image.asset('assets/images/intro2.png',),)
            ),
            PageViewModel(
                decoration: PageDecoration(
                    titleTextStyle: const TextStyle(fontSize: 30),
                    fullScreen: true,
                    pageColor: Colors.orangeAccent.withOpacity(0.5),
                    bodyPadding: const EdgeInsets.all(30),
                    titlePadding: const EdgeInsets.all(40)),
                title: 'Click. Cart. Celebrate!',
                body: 'Your one-stop destination for everything you love. Easy, quick, and hassle-free shopping!',
                image: Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*.1),
                  child: Image.asset('assets/images/intro3.png',),)
            ),

          ],
          onDone: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) =>  LandingPage()));
          },
          onSkip: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) =>  LandingPage()));
          },
          showSkipButton: true,
          skip: const Text("Skip", style: TextStyle(color: Colors.blue)),
          next: const Icon(
            Icons.arrow_forward,
            color: Colors.blue,
          ),
          done: const Text(
            "Done",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ),
      ]),
    );
  }
}
