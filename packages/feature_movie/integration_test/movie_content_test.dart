import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:feature_movie/domain/entities/movie.dart';
import 'package:feature_movie/domain/usecases/get_now_playing_movies.dart';
import 'package:feature_movie/domain/usecases/get_popular_movies.dart';
import 'package:feature_movie/domain/usecases/get_top_rated_movies.dart';
import 'package:feature_movie/presentation/cubit/now_playing/now_playing_movies_cubit.dart';
import 'package:feature_movie/presentation/cubit/popular/popular_movies_cubit.dart';
import 'package:feature_movie/presentation/cubit/top_rated/top_rated_movies_cubit.dart';
import 'package:feature_movie/presentation/pages/movie_list/movie_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'package:integration_test/integration_test.dart';

class _FakeNowPlaying implements GetNowPlayingMovies {
  @override
  Future<Either<Failure, List<Movie>>> execute() async =>
      const Left(ServerFailure('stub error'));
}

class _FakePopular implements GetPopularMovies {
  @override
  Future<Either<Failure, List<Movie>>> execute() async =>
      const Left(ServerFailure('stub error'));
}

class _FakeTopRated implements GetTopRatedMovies {
  @override
  Future<Either<Failure, List<Movie>>> execute() async =>
      const Left(ServerFailure('stub error'));
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
    const MethodChannel('plugins.flutter.io/path_provider'),
    (MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'getApplicationSupportDirectory':
        case 'getApplicationDocumentsDirectory':
        case 'getTemporaryDirectory':
          return '/tmp';
        default:
          return null;
      }
    },
  );

  testWidgets('MovieContent shows lists for now/popular/top rated', (tester) async {
    final now = NowPlayingMoviesCubit(getNowPlayingMovies: _FakeNowPlaying());
    final pop = PopularMoviesCubit(getPopularMovies: _FakePopular());
    final top = TopRatedMoviesCubit(getTopRatedMovies: _FakeTopRated());

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => now),
          BlocProvider(create: (_) => pop),
          BlocProvider(create: (_) => top),
        ],
        child: const MaterialApp(home: MovieContent()),
      ),
    );

    // Allow microtask fetch + rebuild
    await tester.pumpAndSettle(const Duration(milliseconds: 800));
    expect(find.byKey(const Key('error_message_now_playing')), findsOneWidget);
    expect(find.byKey(const Key('error_message_popular')), findsOneWidget);
    expect(find.byKey(const Key('error_message_top_rated')), findsOneWidget);
  });
}
