import 'package:dartz/dartz.dart';
import 'package:feature_tv_series/domain/entities/tv_series_detail.dart';
import 'package:feature_tv_series/domain/usecases/save_watchlist_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late SaveWatchlistTvSeries usecase;
  late MockTvSeriesRepository mockRepository;

  setUp(() {
    mockRepository = MockTvSeriesRepository();
    usecase = SaveWatchlistTvSeries(mockRepository);
  });

  final TvSeriesDetail tDetail = testTvSeriesDetail;

  test('should save tv series to watchlist in repository', () async {
    when(mockRepository.saveWatchlistTvSeries(tDetail))
        .thenAnswer((_) async => const Right('Added to Watchlist'));

    final result = await usecase.execute(tDetail);

    expect(result, const Right('Added to Watchlist'));
  });
}

