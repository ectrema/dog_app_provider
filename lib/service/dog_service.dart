import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'entities/api_response.dart';

part 'dog_service.g.dart';

@RestApi(baseUrl: "https://dog.ceo/api")
abstract class DogService {
  factory DogService(Dio dio, {String baseUrl}) = _DogService;

  @GET("/breeds/list/all")
  Future<ApiResponse> getDog();

  @GET("/breed/{breed}/images/random")
  Future<dynamic> getImageDog(@Path("breed") String breed);
}
