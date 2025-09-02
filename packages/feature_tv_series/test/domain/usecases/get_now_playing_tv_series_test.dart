import 'package:dartz/dartz.dart';
import 'package:feature_tv_series/domain/entities/tv_series.dart';
import 'package:feature_tv_series/domain/usecases/get_now_playing_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late GetNowPlayingTvSeries usecase;
  late MockTvSeriesRepository mockRepository;

  setUp(() {
    mockRepository = MockTvSeriesRepository();
    usecase = GetNowPlayingTvSeries(mockRepository);
  });

  final tList = <TvSeries>[];

  test('should get now playing tv series from repository', () async {
    when(mockRepository.getNowPlayingTvSeries())
        .thenAnswer((_) async => Right(tList));

    final result = await usecase.execute();

    expect(result, Right(tList));
  });
}

