import 'package:flutter/material.dart';

class AppTheme{
  static const Color primaryColor=Colors.indigoAccent;
  static const Color secondaryColor=Colors.indigoAccent;
  static const Color backgroundColor=Colors.indigoAccent;
  static const Color appBarColor = Colors.cyan;
  static const Color buttonColor=Colors.teal;
  static const Color darkBackground=Colors.black;
  static const Color darkText=Colors.white;

  static TextStyle headLine1=const TextStyle(fontSize: 35,fontWeight:FontWeight.bold,color: Colors.black);
  static TextStyle headLine2=const TextStyle(fontSize: 25,fontWeight:FontWeight.w700,color: Colors.black87);
  static TextStyle headLine3=const TextStyle(fontSize: 15,fontWeight:FontWeight.w500,color: Colors.black54);
  static TextStyle darkHeadLine1=const TextStyle(fontSize: 35,fontWeight:FontWeight.bold,color: Colors.white);
  static TextStyle darkHeadLine2=const TextStyle(fontSize: 25,fontWeight:FontWeight.w700,color: Colors.white70);
  static TextStyle darkHeadLine3=const TextStyle(fontSize: 15,fontWeight:FontWeight.w500,color: Colors.white54);

  static ThemeData lightTheme=ThemeData(colorScheme: const ColorScheme.light(primary:primaryColor,secondary:secondaryColor,background: backgroundColor),
    textTheme:TextTheme(headlineLarge: headLine1,headlineMedium: headLine2,headlineSmall: headLine3),
    appBarTheme:const AppBarTheme(color: appBarColor,titleTextStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
    buttonTheme:ButtonThemeData(padding: const EdgeInsets.all(5),buttonColor: buttonColor,textTheme: ButtonTextTheme.normal,shape: Border.all(color: Colors.white,width: 1,))
  );

  static ThemeData darkTheme=ThemeData(colorScheme: const ColorScheme.dark(background: darkBackground),
      textTheme: TextTheme(headlineLarge: darkHeadLine1,headlineMedium: darkHeadLine2,headlineSmall: darkHeadLine3),
      appBarTheme: const AppBarTheme(color: darkBackground,titleTextStyle: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
      buttonTheme:ButtonThemeData(padding: const EdgeInsets.all(5),buttonColor: buttonColor,textTheme: ButtonTextTheme.normal,shape: Border.all(color: Colors.white,width: 1,))
  );
}