import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:test_flutter/domain/datasources/joke_datasource.dart';
import 'package:test_flutter/infrastructure/models/response/joke_response.dart';
import 'package:test_flutter/presentation/entities/joke_entity.dart';
import 'package:test_flutter/presentation/mappers/joke_mapper.dart';
import 'package:test_flutter/utils/exception_helper.dart';

class JokeDatasourceImpl extends JokeDataSource {

  @override
  Future<JokeEntity> getJoke() async {

    try{

      // Call the endpoint
      http.Response response = await http.get(
        Uri.parse('https://api.chucknorris.io/jokes/random'), 
        headers: {
          'Content-Type':'application/json',
          'Accept': 'application/json',
        },
      );

      // Validate the response status code
      if(response.statusCode != 200){
        ExceptionsHelper.validateApiException(response);
      }

      // Parse the response
      JokeResponse parsedResponse = JokeResponse.fromJson(jsonDecode(response.body));

      // Map the response
      JokeEntity jokeEntity = JokeMapper.fromResponse(parsedResponse);

      return jokeEntity;

    } catch(e) {
      rethrow;
    }
    
  }
}