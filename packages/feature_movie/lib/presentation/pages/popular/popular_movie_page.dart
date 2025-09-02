import 'package:feature_movie/presentation/cubit/popular/popular_movies_cubit.dart';
import 'package:feature_movie/presentation/cubit/popular/popular_movies_state.dart';
import 'package:feature_movie/presentation/widget/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMoviesPage extends StatefulWidget {
  const PopularMoviesPage({super.key});

  @override
  State<PopularMoviesPage> createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<PopularMoviesCubit>();
    Future.microtask(() => cubit.fetchPopularMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Popular Movies')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
          builder: (context, state) {
            return state.when(
              initial: () => SizedBox.shrink(),
              loading: () => Center(child: CircularProgressIndicator()),
              loaded: (movies) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return MovieCard(movie);
                  },
                  itemCount: movies.length,
                );
              },
              error: (message) =>
                  Center(key: Key('error_message'), child: Text(message)),
            );
          },
        ),
      ),
    );
  }
}
