import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/common/constants.dart';
import 'package:feature_movie/domain/entities/movie.dart';
import 'package:feature_movie/presentation/cubit/now_playing/now_playing_movies_cubit.dart';
import 'package:feature_movie/presentation/cubit/now_playing/now_playing_movies_state.dart';
import 'package:feature_movie/presentation/cubit/popular/popular_movies_cubit.dart';
import 'package:feature_movie/presentation/cubit/popular/popular_movies_state.dart';
import 'package:feature_movie/presentation/cubit/top_rated/top_rated_movies_cubit.dart';
import 'package:feature_movie/presentation/cubit/top_rated/top_rated_movies_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_ui/theme.dart';

class MovieContent extends StatefulWidget {
  const MovieContent({super.key});

  @override
  _MovieContentState createState() => _MovieContentState();
}

class _MovieContentState extends State<MovieContent> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<NowPlayingMoviesCubit>().fetchNowPlayingMovies();
      context.read<PopularMoviesCubit>().fetchPopularMovies();
      context.read<TopRatedMoviesCubit>().fetchTopRatedMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movies')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Now Playing', style: kHeading6),
            BlocBuilder<NowPlayingMoviesCubit, NowPlayingMoviesState>(
              builder: (context, state) {
                return state.when(
                  initial: () => SizedBox.shrink(),
                  loading: () => Center(child: CircularProgressIndicator()),
                  loaded: (movies) => MovieList(movies),
                  error: (message) =>
                      Text(message, key: Key('error_message_now_playing')),
                );
              },
            ),
            SubHeading(
              title: 'Popular Movies',
              onTap: () {
                context.push(RoutePaths.popularMovies);
              },
            ),
            BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
              builder: (context, state) {
                return state.when(
                  initial: () => SizedBox.shrink(),
                  loading: () => Center(child: CircularProgressIndicator()),
                  loaded: (movies) => MovieList(movies),
                  error: (message) =>
                      Text(message, key: Key('error_message_popular')),
                );
              },
            ),
            SubHeading(
              title: 'Top Rated Movies',
              onTap: () {
                context.push(RoutePaths.topRatedMovies);
              },
            ),
            BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
              builder: (context, state) {
                return state.when(
                  initial: () => SizedBox.shrink(),
                  loading: () => Center(child: CircularProgressIndicator()),
                  loaded: (movies) => MovieList(movies),
                  error: (message) =>
                      Text(message, key: Key('error_message_top_rated')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  const MovieList(this.movies, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                context.push('${RoutePaths.movies}/${movie.id}');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}

class SubHeading extends StatelessWidget {
  final String title;
  final Function() onTap;

  const SubHeading({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: kHeading6,
            overflow: TextOverflow.ellipsis, // Mencegah overflow pada teks
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}
