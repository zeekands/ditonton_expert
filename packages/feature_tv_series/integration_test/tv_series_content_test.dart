import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:feature_tv_series/domain/entities/tv_series.dart';
import 'package:feature_tv_series/domain/usecases/get_now_playing_tv_series.dart';
import 'package:feature_tv_series/domain/usecases/get_popular_tv_series.dart';
import 'package:feature_tv_series/domain/usecases/get_top_rated_tv_series.dart';
import 'package:feature_tv_series/presentaion/cubit/now_playing/now_playing_tv_series_cubit.dart';
import 'package:feature_tv_series/presentaion/cubit/popular/popular_tv_series_cubit.dart';
import 'package:feature_tv_series/presentaion/cubit/top_rated/top_rated_tv_series_cubit.dart';
import 'package:feature_tv_series/presentaion/pages/tv_series_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'package:integration_test/integration_test.dart';

class _FakeNow implements GetNowPlayingTvSeriesUseCase {
  @override
  Future<Either<Failure, List<TvSeries>>> execute() async =>
      const Left(ServerFailure('stub error'));
}

class _FakePopular implements GetPopularTvSeriesUseCase {
  @override
  Future<Either<Failure, List<TvSeries>>> execute() async =>
      const Left(ServerFailure('stub error'));
}

class _FakeTop implements GetTopRatedTvSeriesUseCase {
  @override
  Future<Either<Failure, List<TvSeries>>> execute() async =>
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

  testWidgets('TvSeriesContent shows sections', (tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => NowPlayingTvSeriesCubit(getNowPlaying: _FakeNow())),
          BlocProvider(create: (_) => PopularTvSeriesCubit(getPopular: _FakePopular())),
          BlocProvider(create: (_) => TopRatedTvSeriesCubit(getTopRatedTvSeries: _FakeTop())),
        ],
        child: const MaterialApp(home: TvSeriesContent()),
      ),
    );

    await tester.pumpAndSettle(const Duration(milliseconds: 800));

    expect(find.text('On The Air'), findsOneWidget);
    expect(find.text('Popular TV Series'), findsOneWidget);
    expect(find.text('Top Rated TV Series'), findsOneWidget);
  });
}
