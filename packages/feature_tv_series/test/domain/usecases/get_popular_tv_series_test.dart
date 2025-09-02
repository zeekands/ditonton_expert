import 'package:dartz/dartz.dart';
import 'package:feature_tv_series/domain/entities/tv_series.dart';
import 'package:feature_tv_series/domain/usecases/get_popular_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late GetPopularTvSeries usecase;
  late MockTvSeriesRepository mockRepository;

  setUp(() {
    mockRepository = MockTvSeriesRepository();
    usecase = GetPopularTvSeries(mockRepository);
  });

  final tList = <TvSeries>[];

  test('should get popular tv series from repository', () async {
    when(mockRepository.getPopularTvSeries())
        .thenAnswer((_) async => Right(tList));

    final result = await usecase.execute();

    expect(result, Right(tList));
  });
}

