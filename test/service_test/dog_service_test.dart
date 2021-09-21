import 'package:dio/dio.dart';
import 'package:dog_app_provider/app/dog_provider.dart';
import 'package:dog_app_provider/service/dog_service.dart';
import 'package:dog_app_provider/service/entities/api_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  //
  ApiResponse apiResponse;
  DogProvider _controller;
  setUp(() {
    _controller = DogProvider(dogService: DogService(Dio()));
    apiResponse = ApiResponse(
      message: {
        "affenpinscher": [],
        "african": [],
      },
      status: 'success',
    );
  });
  group('[Location Model]', () {
    //
    test('[Model] Check individual values', () async {
      apiResponse = ApiResponse(
        message: {
          "affenpinscher": [],
          "african": [],
        },
        status: 'success',
      );
// BEGIN TESTS....
      expect(apiResponse.message!.length, 2);
      expect(apiResponse.status, 'success');
    });
  });
}
