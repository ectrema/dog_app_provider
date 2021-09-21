import 'package:dio/dio.dart';
import 'package:dog_app_provider/app/dog_provider.dart';
import 'package:dog_app_provider/service/dog_service.dart';
import 'package:dog_app_provider/service/entities/dog.dart';
import 'package:dog_app_provider/ui/dog/widget/detail_dog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DogView extends StatelessWidget {
  DogView({Key? key}) : super(key: key);
  final DogProvider dogProvider = DogProvider(
    dogService: DogService(
      Dio(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DogProvider>(
      create: (_) {
        dogProvider.getDog();
        return dogProvider;
      },
      child: Consumer<DogProvider>(
        builder: (_, model, child) => model.dogs.isNotEmpty
            ? _buildDogList(model, context)
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Widget _buildDogList(DogProvider model, BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        children: List.generate(
          model.dogs.length,
          (index) => _buildDogItem(model.dogs[index], context),
        ),
      ),
    );
  }

  Widget _buildDogItem(Dog dog, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailDog(dog: dog),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              dog.name!.toUpperCase(),
            ),
            Image.network(
              dog.imageLisk ?? '',
              fit: BoxFit.fill,
              height: 150,
            )
          ],
        ),
      ),
    );
  }
}
