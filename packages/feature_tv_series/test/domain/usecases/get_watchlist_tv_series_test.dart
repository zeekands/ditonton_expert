import 'package:dartz/dartz.dart';
import 'package:feature_tv_series/domain/entities/tv_series.dart';
import 'package:feature_tv_series/domain/usecases/get_watchlist_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late GetWatchlistTvSeries usecase;
  late MockTvSeriesRepository mockRepository;

  setUp(() {
    mockRepository = MockTvSeriesRepository();
    usecase = GetWatchlistTvSeries(mockRepository);
  });

  final tList = <TvSeries>[];

  test('should get watchlist tv series from repository', () async {
    when(mockRepository.getWatchlistTvSeries())
        .thenAnswer((_) async => Right(tList));

    final result = await usecase.execute();

    expect(result, Right(tList));
  });
}

