import 'package:dartz/dartz.dart';
import 'package:feature_tv_series/domain/entities/tv_series.dart';
import 'package:feature_tv_series/domain/usecases/search_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late SearchTvSeries usecase;
  late MockTvSeriesRepository mockRepository;

  setUp(() {
    mockRepository = MockTvSeriesRepository();
    usecase = SearchTvSeries(mockRepository);
  });

  const tQuery = 'squid';
  final tList = <TvSeries>[];

  test('should get searched tv series from repository', () async {
    when(mockRepository.searchTvSeries(tQuery))
        .thenAnswer((_) async => Right(tList));

    final result = await usecase.execute(tQuery);

    expect(result, Right(tList));
  });
}

