import 'dart:convert';

import 'package:feature_tv_series/data/models/tv_series_model.dart';
import 'package:feature_tv_series/data/models/tv_series_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tTvSeriesModel = TvSeriesModel(
    backdropPath: '/path.jpg',
    genreIds: [1, 2, 3],
    id: 1,
    name: 'Name',
    originalName: 'Original Name',
    overview: 'Overview',
    popularity: 1.0,
    posterPath: '/path.jpg',
    firstAirDate: '2020-05-05',
    voteAverage: 1.0,
    voteCount: 1,
    episodeRunTime: [1],
    numberOfEpisodes: 1,
    numberOfSeasons: 1,
  );
  final tTvSeriesResponseModel =
      TvSeriesResponse(tvSeriesList: <TvSeriesModel>[tTvSeriesModel]);

  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final jsonMap = json.decode(json.encode({
        'results': [
          {
            'backdrop_path': '/path.jpg',
            'genre_ids': [1, 2, 3],
            'id': 1,
            'name': 'Name',
            'original_name': 'Original Name',
            'overview': 'Overview',
            'popularity': 1.0,
            'poster_path': '/path.jpg',
            'first_air_date': '2020-05-05',
            'vote_average': 1.0,
            'vote_count': 1,
            'episode_run_time': [1],
            'number_of_episodes': 1,
            'number_of_seasons': 1,
          },
        ]
      }));
      // act
      final result = TvSeriesResponse.fromJson(jsonMap);
      // assert
      expect(result, tTvSeriesResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = tTvSeriesResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        "results": [
          {
            "backdrop_path": "/path.jpg",
            "genre_ids": [1, 2, 3],
            "id": 1,
            "name": "Name",
            "original_name": "Original Name",
            "overview": "Overview",
            "popularity": 1.0,
            "poster_path": "/path.jpg",
            "first_air_date": "2020-05-05",
            "vote_average": 1.0,
            "vote_count": 1,
            "episode_run_time": [1],
            "number_of_episodes": 1,
            "number_of_seasons": 1,
          }
        ],
      };
      expect(result, expectedJsonMap);
    });
  });
}
