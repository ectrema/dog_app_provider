import 'package:dog_app_provider/service/dog_service.dart';
import 'package:dog_app_provider/service/entities/api_response.dart';
import 'package:dog_app_provider/service/entities/dog.dart';
import 'package:flutter/foundation.dart';

class DogProvider with ChangeNotifier {
  final DogService dogService;
  List<Dog> dogs = <Dog>[];

  DogProvider({required this.dogService});

  Future<void> getDog() async {
    if(dogs.isEmpty) {
      ApiResponse _temp = await dogService.getDog();
      List<Dog> dogList = <Dog>[];
      _temp.message?.forEach((key, value) {
        if ((value as List).isEmpty) {
          dogList.add(Dog(name: key));
        } else {
          for (var element in value) {
            dogList.add(Dog(name: '$key $element'));
          }
        }
      });
      for (var i = 0; i < dogList.length; i++) {
        dogList[i] = dogList[i].copywith(
          imageLisk: await dogService
              .getImageDog(dogList[i].name?.replaceAll(' ', '/') ?? '')
              .then(
                (value) => value['message'],
              ),
        );
      }
      dogs
        ..clear()
        ..addAll(dogList);
      notifyListeners();
    }
  }
}
