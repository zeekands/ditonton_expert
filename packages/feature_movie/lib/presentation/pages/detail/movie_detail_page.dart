import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/common/constants.dart';
import 'package:feature_movie/presentation/cubit/detail/movie_detail_cubit.dart';
import 'package:feature_movie/presentation/cubit/detail/movie_detail_state.dart';
import 'package:shared_ui/theme.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:feature_movie/domain/entities/movie.dart';
import 'package:feature_movie/domain/entities/movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_ui/widget/rating_bar.dart';

class MovieDetailPage extends StatefulWidget {
  final int id;
  const MovieDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<MovieDetailCubit>().fetchMovieDetail(widget.id);
      context.read<MovieDetailCubit>().loadWatchlistStatus(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MovieDetailCubit, MovieDetailState>(
        listener: (context, state) {
          state.whenOrNull(
            loaded: (movieDetail, recommendations, isAdded, message) {
              if (message == MovieDetailCubit.watchlistAddSuccessMessage ||
                  message == MovieDetailCubit.watchlistRemoveSuccessMessage) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(message)));
              } else if (message.isNotEmpty) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(content: Text(message));
                  },
                );
              }
            },
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => SizedBox.shrink(),
            loading: () => Center(child: CircularProgressIndicator()),
            loaded: (movieDetail, recommendations, isAdded, message) {
              return SafeArea(
                child: DetailContent(movieDetail, recommendations, isAdded),
              );
            },
            error: (message) => Text(message, key: Key('error_message')),
          );
        },
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  final MovieDetail movie;
  final List<Movie> recommendations;
  final bool isAddedWatchlist;

  DetailContent(this.movie, this.recommendations, this.isAddedWatchlist);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
          width: screenWidth,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(movie.title, style: kHeading5),
                            FilledButton(
                              onPressed: () async {
                                final cubit = context.read<MovieDetailCubit>();
                                if (!isAddedWatchlist) {
                                  await cubit.addWatchlist(movie);
                                } else {
                                  await cubit.removeFromWatchlist(movie);
                                }
                                await cubit.loadWatchlistStatus(movie.id);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  isAddedWatchlist
                                      ? Icon(Icons.check)
                                      : Icon(Icons.add),
                                  Text('Watchlist'),
                                ],
                              ),
                            ),
                            Text(_showGenres(movie.genres)),
                            Text(_showRuntime(movie.runtime)),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: movie.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) =>
                                      Icon(Icons.star, color: kMikadoYellow),
                                  itemSize: 24,
                                ),
                                Text('${movie.voteAverage}'),
                              ],
                            ),
                            SizedBox(height: 16),
                            Text('Overview', style: kHeading6),
                            Text(movie.overview),
                            SizedBox(height: 16),
                            Text('Recommendations', style: kHeading6),
                            SizedBox(
                              height: 150,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final movie = recommendations[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: InkWell(
                                      onTap: () {
                                        context.push(
                                          '${RoutePaths.movies}/${movie.id}',
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              '$BASE_IMAGE_URL${movie.posterPath}',
                                          placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: recommendations.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            minChildSize: 0.25,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ),
      ],
    );
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += genre.name + ', ';
    }
    return result.isEmpty ? '' : result.substring(0, result.length - 2);
  }

  String _showRuntime(int runtime) {
    final int hours = runtime ~/ 60;
    final int remainingMinutes = runtime % 60;
    return '${hours}h ${remainingMinutes}m';
  }
}
