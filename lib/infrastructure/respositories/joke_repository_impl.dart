import 'package:test_flutter/domain/datasources/joke_datasource.dart';
import 'package:test_flutter/domain/repositories/joke_repository.dart';
import 'package:test_flutter/presentation/entities/joke_entity.dart';

class JokeRepositoryImpl extends JokeRepository {

  JokeRepositoryImpl(
    this.jokeDatasource
  );

  final JokeDataSource jokeDatasource;

  @override
  Future<JokeEntity> getJoke() {
    try {

      return jokeDatasource.getJoke();

    } catch(e) {
      rethrow;
    }
  }
}