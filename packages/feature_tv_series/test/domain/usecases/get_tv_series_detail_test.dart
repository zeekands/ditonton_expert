import 'package:dartz/dartz.dart';
import 'package:feature_tv_series/domain/entities/tv_series_detail.dart';
import 'package:feature_tv_series/domain/usecases/get_tv_series_detail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late GetTvSeriesDetail usecase;
  late MockTvSeriesRepository mockRepository;

  setUp(() {
    mockRepository = MockTvSeriesRepository();
    usecase = GetTvSeriesDetail(mockRepository);
  });

  const tId = 1;
  final TvSeriesDetail tDetail = testTvSeriesDetail;

  test('should get tv series detail from repository', () async {
    when(mockRepository.getTvSeriesDetail(tId))
        .thenAnswer((_) async => Right(tDetail));

    final result = await usecase.execute(tId);

    expect(result, Right(tDetail));
  });
}

