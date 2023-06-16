import 'package:test_flutter/presentation/entities/joke_entity.dart';

abstract class JokeDataSource {

  /// Call the endpoint to get a joke
  Future<JokeEntity> getJoke();

}