

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopease/models/LoginResponseModel.dart';
part 'ApiServices.g.dart';

@RestApi()
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST('https://api.escuelajs.co/api/v1/auth/login')
  @FormUrlEncoded()
  Future<LoginResponseModel> login(@Body() Map<String, dynamic> body);
}