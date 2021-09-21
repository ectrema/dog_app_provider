import 'package:dog_app_provider/service/entities/login_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'login_service.g.dart';

@RestApi(baseUrl: "https://reqres.in/api")
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @POST("/login")
  Future<LoginResponse> postLogin(
      @Field('email') String email, @Field('password') String password);
}
