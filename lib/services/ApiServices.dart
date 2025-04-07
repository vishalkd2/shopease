import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopease/models/LoginResponseModel.dart';
import 'package:shopease/models/RegistrationResponseModel.dart';
part 'ApiServices.g.dart';

@RestApi()
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST('https://api.escuelajs.co/api/v1/auth/login')
  @FormUrlEncoded()
  Future<LoginResponseModel> login(@Body() Map<String, dynamic> body);

  @POST('https://api.escuelajs.co/api/v1/users')
  Future<RegistrationResponseModel> registerUser(
    @Field('name') String name,
    @Field('email') String email,
    @Field('avatar') String avatar,
    @Field('password') String password,
  );
}
