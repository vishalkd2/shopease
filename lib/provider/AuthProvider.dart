import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:shopease/services/ApiServices.dart';

class AuthProvider extends ChangeNotifier{

  final ApiServices apiServices;
  final FlutterSecureStorage storage =FlutterSecureStorage();
  bool _isLoggedIn = false;
  bool get isLoggedIn =>_isLoggedIn;

  AuthProvider (this.apiServices){
     checkLoginStatus();
  }

  Future<void> login(String email,String password)async{
    try{
      final response = await apiServices.login({'email':email,'password':password});
      print('Login response: ${response.accessToken}');
     if(response!=null &&response.accessToken !=null ){
       await storage.write(key: 'token', value: response.accessToken);
       _isLoggedIn = true;

       print('Login successful. Token saved.'); // Debugging
       notifyListeners();
     }else{
       print('Login failed: Invalid response.'); // Debugging
     }
    }catch(e){print("Error:$e");}
  }

  // Future<void> register(String name, String email, String password, String imageUrl) async {
  //   try {
  //     final response = await apiService.register({
  //       'name': name,
  //       'email': email,
  //       'password': password,
  //       'image': imageUrl,
  //     });
  //     print('Registration success: $response');
  //   } catch (e) {
  //     print('Registration error: $e');
  //   }
  // }

Future<void>  checkLoginStatus()async{
    final token = await storage.read(key: 'token');
    if(token != null){ _isLoggedIn= true;  notifyListeners(); }
}

Future<void> logout()async{
    await storage.delete(key: 'token');
    _isLoggedIn=false;
    notifyListeners();
}
}