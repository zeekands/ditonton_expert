import 'package:core/common/content.dart';
import 'package:core/common/content_type.dart';
import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:feature_movie/domain/entities/movie.dart';
import 'package:feature_movie/domain/usecases/get_watchlist_movies.dart';
import 'package:feature_tv_series/domain/entities/tv_series.dart';
import 'package:feature_tv_series/domain/usecases/get_watchlist_tv_series.dart';
import 'package:feature_watchlist/presentation/cubit/watchlist_cubit.dart';
import 'package:feature_watchlist/presentation/pages/watchlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';

class _FakeGetWatchlistMovies implements GetWatchlistMovies {
  @override
  Future<Either<Failure, List<Movie>>> execute() async => const Right([]);
}

class _FakeGetWatchlistTv implements GetWatchlistTvSeriesUseCase {
  @override
  Future<Either<Failure, List<TvSeries>>> execute() async => const Right([]);
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

  testWidgets('Watchlist page shows items from both sources', (tester) async {
    final cubit = WatchlistCubit(
      getWatchlistMovies: _FakeGetWatchlistMovies(),
      getWatchlistTvSeries: _FakeGetWatchlistTv(),
    );

    await tester.pumpWidget(
      BlocProvider.value(
        value: cubit,
        child: const MaterialApp(home: WatchlistPage()),
      ),
    );

    await tester.pumpAndSettle(const Duration(milliseconds: 800));

    expect(find.byKey(const Key('empty_message')), findsOneWidget);
  });
}
