import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/infrastructure/datasources/joke_datasource_impl.dart';
import 'package:test_flutter/infrastructure/respositories/joke_repository_impl.dart';
import 'package:test_flutter/presentation/entities/joke_entity.dart';

/// This provider will call the repository to get the joke
final Provider<JokeRepositoryImpl> jokeRepositoryProvider = Provider((ref) {

  // Get the instance of the datasource and pass it to the repository
  return JokeRepositoryImpl(JokeDatasourceImpl());
});

/// This provider will call the repository to get the joke
final FutureProvider<List<JokeEntity>> jokeProvider = FutureProvider<List<JokeEntity>>((ref) async {

  // Get the instance of the repository provider
  final JokeRepositoryImpl jokeRepository = ref.read(jokeRepositoryProvider);

  // Create a list of jokes
  List<JokeEntity> jokes = [];

  // Call the repository 20 times to get the jokes
  for(var i = 0 ; i <= 20; i++ ){
    // Get the instance of the repository

    // Call the repository to get the joke
    JokeEntity joke = await jokeRepository.getJoke();

    // Add the joke to the list
    jokes.add(joke);

  }

  return jokes;
});