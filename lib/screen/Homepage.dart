

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopease/provider/AuthProvider.dart';
import 'package:shopease/screen/LandingPage.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(appBar: AppBar(title: Text('Homepage'),actions: [
      IconButton(onPressed: ()async{
        await authProvider.logout();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LandingPage()));
      },
        icon: Icon(Icons.logout))],),
    body: Center(child: Text("Homepage",style: TextStyle(fontSize: 30),)),
    );
  }
}
