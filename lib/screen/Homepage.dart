import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shopease/screen/HomeContent.dart';

import 'CartPage.dart';
import 'ProfilePage.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex = 1;
  final List<Widget> screens =[CartPage(),HomeContent(),ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: screens[selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        onTap: (index){setState(() {
          selectedIndex=index;
        });},
        items: const <Widget>[
          Icon(Icons.add_shopping_cart,size: 30,),
          Icon(Icons.home,size: 30,),
          Icon(Icons.person,size: 30,)
        ],
        index: 1,
        color: Colors.orange.shade500,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeOut,
        animationDuration: Duration(milliseconds: 300),
      ),
    );
  }
}
