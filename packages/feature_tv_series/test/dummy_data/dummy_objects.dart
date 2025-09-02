import 'package:core/domain/entities/genre.dart';
import 'package:feature_tv_series/data/models/tv_series_table.dart';
import 'package:feature_tv_series/domain/entities/tv_series.dart';
import 'package:feature_tv_series/domain/entities/tv_series_detail.dart';

final testTvSeries = TvSeries(
  backdropPath: '/rQGBwzX9ZqH1Fz82L5N68b693W.jpg',
  id: 456,
  name: 'Stranger Things',
  originalName: 'Stranger Things',
  overview:
      'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
  popularity: 123.456,
  posterPath: '/49WJfeN0moxb9IPfGn8AIqD9TD.jpg',
  firstAirDate: '2016-07-15',
  voteAverage: 8.6,
  voteCount: 12345,
  genreIds: [1],
  episodeRunTime: [60],
  numberOfEpisodes: 34,
  numberOfSeasons: 4,
);

final testTvSeriesList = [testTvSeries];

final testTvSeriesDetail = TvSeriesDetail(
  backdropPath: '/rQGBwzX9ZqH1Fz82L5N68b693W.jpg',
  genres: [Genre(id: 18, name: 'Drama')],
  id: 456,
  name: 'Stranger Things',
  originalName: 'Stranger Things',
  overview:
      'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
  posterPath: '/49WJfeN0moxb9IPfGn8AIqD9TD.jpg',
  firstAirDate: '2016-07-15',
  episodeRunTime: [60],
  numberOfEpisodes: 34,
  numberOfSeasons: 4,
  voteAverage: 8.6,
  voteCount: 12345,
);

final testWatchlistTvSeries = TvSeries.watchlist(
  id: 1,
  name: 'Test Series',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testTvSeriesTable = TvSeriesTable(
  id: 1,
  name: 'Test Series',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testTvSeriesMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'name': 'Test Series',
};
