
import 'package:test_flutter/presentation/entities/joke_entity.dart';

abstract class JokeRepository {

  /// Call the endpoint to get a joke
  Future<JokeEntity> getJoke();

}