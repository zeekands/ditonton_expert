import 'package:feature_tv_series/domain/usecases/get_watchlist_status_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late GetWatchlistStatusTvSeries usecase;
  late MockTvSeriesRepository mockRepository;

  setUp(() {
    mockRepository = MockTvSeriesRepository();
    usecase = GetWatchlistStatusTvSeries(mockRepository);
  });

  const tId = 1;

  test('should return watchlist status from repository', () async {
    when(mockRepository.isAddedToWatchlistTvSeries(tId))
        .thenAnswer((_) async => true);

    final result = await usecase.execute(tId);

    expect(result, true);
  });
}

