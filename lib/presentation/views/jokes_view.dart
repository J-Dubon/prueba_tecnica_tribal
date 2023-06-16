import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/presentation/entities/joke_entity.dart';
import 'package:test_flutter/presentation/providers/joke_provider.dart' as jokes;

class JokesView extends ConsumerStatefulWidget {
  const JokesView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JokesViewState();
}

class _JokesViewState extends ConsumerState<JokesView> {

  @override
  Widget build(BuildContext context) {

    // Get the joke provider
    final AsyncValue<List<JokeEntity>> jokeProvider = ref.watch(jokes.jokeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('This is a Joke App'),
      ),
      body: jokeProvider.when(

        // When the data is loaded
        data: (joke) {
          return ListView.builder(
            itemCount: joke.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [

                  // Joke LisTile
                  ListTile(
                    leading: const Icon(Icons.ac_unit),
                    title: Text(joke[index].value),
                  ),

                  // Divider
                  Divider(
                    height: 24,
                    thickness: 1,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ],
              );
            },
          );
        },

        // When the data is loading
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },

        // When the data is error
        error: (e, s) {
          return Center(
            child: Text(e.toString()),
          );
        }
      )
    );
  }
}