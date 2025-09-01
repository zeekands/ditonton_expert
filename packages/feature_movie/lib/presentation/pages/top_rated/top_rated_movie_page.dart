import 'package:feature_movie/presentation/cubit/top_rated/top_rated_movies_cubit.dart';
import 'package:feature_movie/presentation/cubit/top_rated/top_rated_movies_state.dart';
import 'package:feature_movie/presentation/widget/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedMoviesPage extends StatefulWidget {
  static const ROUTE_NAME = 'RoutePaths.watchlist';

  @override
  _TopRatedMoviesPageState createState() => _TopRatedMoviesPageState();
}

class _TopRatedMoviesPageState extends State<TopRatedMoviesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<TopRatedMoviesCubit>().fetchTopRatedMovies(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Top Rated Movies')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
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
