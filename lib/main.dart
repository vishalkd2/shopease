import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shopease/AppTheme.dart';
import 'package:shopease/provider/AuthProvider.dart';
import 'package:shopease/screen/AppStart.dart';
import 'package:provider/provider.dart';
import 'package:shopease/services/ApiServices.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final apiServices = ApiServices(Dio());
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(apiServices),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          home: AppStart()),
    );
  }
}
