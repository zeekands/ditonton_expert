import 'package:dartz/dartz.dart';
import 'package:feature_tv_series/domain/entities/tv_series.dart';
import 'package:feature_tv_series/domain/usecases/get_tv_series_recommendations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late GetTvSeriesRecommendations usecase;
  late MockTvSeriesRepository mockRepository;

  setUp(() {
    mockRepository = MockTvSeriesRepository();
    usecase = GetTvSeriesRecommendations(mockRepository);
  });

  const tId = 1;
  final tList = <TvSeries>[];

  test('should get tv series recommendations from repository', () async {
    when(mockRepository.getTvSeriesRecommendations(tId))
        .thenAnswer((_) async => Right(tList));

    final result = await usecase.execute(tId);

    expect(result, Right(tList));
  });
}

