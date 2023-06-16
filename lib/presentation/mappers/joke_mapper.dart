import 'package:test_flutter/infrastructure/models/response/joke_response.dart';
import 'package:test_flutter/presentation/entities/joke_entity.dart';

class JokeMapper {

  /// Map the response to the entity
  static JokeEntity fromResponse(JokeResponse jokeResponse) {
    return JokeEntity(
      iconUrl: jokeResponse.iconUrl,
      url: jokeResponse.url,
      value: jokeResponse.value,
      categories: jokeResponse.categories,
      createdAt: jokeResponse.createdAt,
      updatedAt: jokeResponse.updatedAt,
    );
  }

}