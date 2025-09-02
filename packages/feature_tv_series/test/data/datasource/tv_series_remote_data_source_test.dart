import 'dart:convert';

import 'package:core/common/exception.dart';
import 'package:feature_tv_series/data/datasources/tv_series_remote_data_source.dart';
import 'package:feature_tv_series/data/models/tv_series_detail_model.dart';
import 'package:feature_tv_series/data/models/tv_series_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

class _FakeHttpClient extends http.BaseClient {
  final Map<Uri, http.Response> _responses = {};

  void setResponse(Uri uri, http.Response response) {
    _responses[uri] = response;
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final response = _responses[request.url];
    if (response == null) {
      return http.StreamedResponse(Stream.value(utf8.encode('Not Found')), 404);
    }
    return http.StreamedResponse(
      Stream<List<int>>.fromIterable([response.bodyBytes]),
      response.statusCode,
      headers: response.headers,
      reasonPhrase: response.reasonPhrase,
    );
  }
}

void main() {
  const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  const BASE_URL = 'https://api.themoviedb.org/3';

  late TvSeriesRemoteDataSourceImpl dataSource;
  late _FakeHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = _FakeHttpClient();
    dataSource = TvSeriesRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get On The Air TV Series', () {
    final okListJson = json.encode({
      'results': [
        {
          'backdrop_path': '/path.jpg',
          'genre_ids': [1, 2],
          'id': 1,
          'name': 'Sample',
          'original_name': 'Sample',
          'overview': 'desc',
          'popularity': 10.0,
          'poster_path': '/poster.jpg',
          'first_air_date': '2020-01-01',
          'vote_average': 7.5,
          'vote_count': 100,
          'episode_run_time': [60],
          'number_of_episodes': 10,
          'number_of_seasons': 1,
        }
      ]
    });
    final tTvSeriesList =
        TvSeriesResponse.fromJson(json.decode(okListJson)).tvSeriesList;

    test('should return list of Tv Series Model when the response code is 200',
        () async {
      // arrange
      mockHttpClient.setResponse(
        Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY'),
        http.Response(okListJson, 200),
      );
      // act
      final result = await dataSource.getNowPlayingTvSeries();
      // assert
      expect(result, equals(tTvSeriesList));
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      mockHttpClient.setResponse(
        Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY'),
        http.Response('Not Found', 404),
      );
      // act
      final call = dataSource.getNowPlayingTvSeries();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get Popular TV Series', () {
    final okListJson = json.encode({
      'results': [
        {
          'backdrop_path': '/path.jpg',
          'genre_ids': [1],
          'id': 2,
          'name': 'Popular',
          'original_name': 'Popular',
          'overview': 'desc',
          'popularity': 20.0,
          'poster_path': '/poster2.jpg',
          'first_air_date': '2020-02-01',
          'vote_average': 8.0,
          'vote_count': 200,
          'episode_run_time': [45],
          'number_of_episodes': 8,
          'number_of_seasons': 1,
        }
      ]
    });
    final tTvSeriesList =
        TvSeriesResponse.fromJson(json.decode(okListJson)).tvSeriesList;

    test('should return list of TV Series when response is success (200)',
        () async {
      // arrange
      mockHttpClient.setResponse(
        Uri.parse('$BASE_URL/tv/popular?$API_KEY'),
        http.Response(okListJson, 200),
      );
      // act
      final result = await dataSource.getPopularTvSeries();
      // assert
      expect(result, tTvSeriesList);
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      mockHttpClient.setResponse(
        Uri.parse('$BASE_URL/tv/popular?$API_KEY'),
        http.Response('Not Found', 404),
      );
      // act
      final call = dataSource.getPopularTvSeries();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get Top Rated TV Series', () {
    final okListJson = json.encode({
      'results': [
        {
          'backdrop_path': '/path.jpg',
          'genre_ids': [3],
          'id': 3,
          'name': 'Top',
          'original_name': 'Top',
          'overview': 'desc',
          'popularity': 30.0,
          'poster_path': '/poster3.jpg',
          'first_air_date': '2020-03-01',
          'vote_average': 9.0,
          'vote_count': 300,
          'episode_run_time': [50],
          'number_of_episodes': 12,
          'number_of_seasons': 2,
        }
      ]
    });
    final tTvSeriesList =
        TvSeriesResponse.fromJson(json.decode(okListJson)).tvSeriesList;

    test('should return list of TV Series when response code is 200 ',
        () async {
      // arrange
      mockHttpClient.setResponse(
        Uri.parse('$BASE_URL/tv/top_rated?$API_KEY'),
        http.Response(okListJson, 200),
      );
      // act
      final result = await dataSource.getTopRatedTvSeries();
      // assert
      expect(result, tTvSeriesList);
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      // arrange
      mockHttpClient.setResponse(
        Uri.parse('$BASE_URL/tv/top_rated?$API_KEY'),
        http.Response('Not Found', 404),
      );
      // act
      final call = dataSource.getTopRatedTvSeries();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get tv series detail', () {
    final tId = 1;
    final detailJson = json.encode({
      'backdrop_path': '/path.jpg',
      'genres': [
        {'id': 1, 'name': 'Action'}
      ],
      'homepage': 'https://example.com',
      'id': tId,
      'original_language': 'en',
      'name': 'Detail',
      'overview': 'overview',
      'popularity': 11.0,
      'poster_path': '/poster.jpg',
      'first_air_date': '2020-01-01',
      'episode_run_time': [60],
      'number_of_episodes': 10,
      'number_of_seasons': 1,
      'status': 'Ended',
      'tagline': 'tag',
      'vote_average': 7.0,
      'vote_count': 100,
    });
    final tTvSeriesDetail =
        TvSeriesDetailResponse.fromJson(json.decode(detailJson));

    test('should return TV Series detail when the response code is 200',
        () async {
      // arrange
      mockHttpClient.setResponse(
        Uri.parse('$BASE_URL/tv/$tId?$API_KEY'),
        http.Response(detailJson, 200),
      );
      // act
      final result = await dataSource.getTvSeriesDetail(tId);
      // assert
      expect(result, equals(tTvSeriesDetail));
    });

    test('should throw Server Exception when the response code is 404 or other',
        () async {
      // arrange
      mockHttpClient.setResponse(
        Uri.parse('$BASE_URL/tv/$tId?$API_KEY'),
        http.Response('Not Found', 404),
      );
      // act
      final call = dataSource.getTvSeriesDetail(tId);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get tv series recommendations', () {
    final okListJson = json.encode({
      'results': [
        {
          'backdrop_path': '/path.jpg',
          'genre_ids': [1, 4],
          'id': 4,
          'name': 'Rec',
          'original_name': 'Rec',
          'overview': 'desc',
          'popularity': 15.0,
          'poster_path': '/poster4.jpg',
          'first_air_date': '2020-04-01',
          'vote_average': 8.5,
          'vote_count': 150,
          'episode_run_time': [48],
          'number_of_episodes': 6,
          'number_of_seasons': 1,
        }
      ]
    });
    final tTvSeriesList =
        TvSeriesResponse.fromJson(json.decode(okListJson)).tvSeriesList;
    final tId = 1;

    test('should return list of TV Series Model when the response code is 200',
        () async {
      // arrange
      mockHttpClient.setResponse(
        Uri.parse('$BASE_URL/tv/$tId/recommendations?$API_KEY'),
        http.Response(okListJson, 200),
      );
      // act
      final result = await dataSource.getTvSeriesRecommendations(tId);
      // assert
      expect(result, equals(tTvSeriesList));
    });

    test('should throw Server Exception when the response code is 404 or other',
        () async {
      // arrange
      mockHttpClient.setResponse(
        Uri.parse('$BASE_URL/tv/$tId/recommendations?$API_KEY'),
        http.Response('Not Found', 404),
      );
      // act
      final call = dataSource.getTvSeriesRecommendations(tId);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('search tv series', () {
    final okListJson = json.encode({
      'results': [
        {
          'backdrop_path': '/path.jpg',
          'genre_ids': [5],
          'id': 5,
          'name': 'Squid Game',
          'original_name': 'Squid Game',
          'overview': 'desc',
          'popularity': 50.0,
          'poster_path': '/poster5.jpg',
          'first_air_date': '2021-01-01',
          'vote_average': 9.1,
          'vote_count': 999,
          'episode_run_time': [55],
          'number_of_episodes': 9,
          'number_of_seasons': 1,
        }
      ]
    });
    final tSearchResult =
        TvSeriesResponse.fromJson(json.decode(okListJson)).tvSeriesList;
    final tQuery = 'Squid Game';

    test('should return list of TV Series when response code is 200', () async {
      // arrange
      mockHttpClient.setResponse(
        Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$tQuery'),
        http.Response(okListJson, 200),
      );
      // act
      final result = await dataSource.searchTvSeries(tQuery);
      // assert
      expect(result, tSearchResult);
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      // arrange
      mockHttpClient.setResponse(
        Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$tQuery'),
        http.Response('Not Found', 404),
      );
      // act
      final call = dataSource.searchTvSeries(tQuery);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
// ignore_for_file: constant_identifier_names
