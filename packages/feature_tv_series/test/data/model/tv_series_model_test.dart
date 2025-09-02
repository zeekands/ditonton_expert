import 'package:feature_tv_series/data/models/tv_series_model.dart';
import 'package:feature_tv_series/domain/entities/tv_series.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Deklarasi objek TvSeriesModel untuk diuji
  final tTvSeriesModel = TvSeriesModel(
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    name: 'name',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    firstAirDate: 'firstAirDate',
    voteAverage: 1,
    voteCount: 1,
    episodeRunTime: [1],
    numberOfEpisodes: 1,
    numberOfSeasons: 1,
  );

  // Deklarasi objek TvSeries yang diharapkan
  final tTvSeries = TvSeries(
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    name: 'name',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    firstAirDate: 'firstAirDate',
    voteAverage: 1,
    voteCount: 1,
    episodeRunTime: [1],
    numberOfEpisodes: 1,
    numberOfSeasons: 1,
  );

  test('should be a subclass of TvSeries entity', () async {
    // Memanggil metode toEntity() dan membandingkan hasilnya
    final result = tTvSeriesModel.toEntity();
    expect(result, tTvSeries);
  });
}
