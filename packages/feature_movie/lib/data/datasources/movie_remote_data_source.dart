import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:core/core.dart';
import 'package:feature_movie/data/models/movie_detail_model.dart';
import 'package:feature_movie/data/models/movie_model.dart';
import 'package:feature_movie/data/models/movie_response.dart';
import 'package:http/http.dart' as http;

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailResponse> getMovieDetail(int id);
  Future<List<MovieModel>> getMovieRecommendations(int id);
  Future<List<MovieModel>> searchMovies(String query);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  static const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const BASE_URL = 'https://api.themoviedb.org/3';

  final http.Client client;

  MovieRemoteDataSourceImpl({required this.client});

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    try {
      final response = await client
          .get(Uri.parse('$BASE_URL/movie/now_playing?$API_KEY'))
          .timeout(Duration(seconds: 10)); // Tambahkan timeout

      if (response.statusCode == 200) {
        return MovieResponse.fromJson(json.decode(response.body)).movieList;
      } else {
        throw ServerException('Failed to connect to the server');
      }
    } on SocketException {
      throw ServerException('Failed to connect to the server');
    } on TimeoutException {
      throw ServerException('Failed to connect to the server');
    } on FormatException {
      throw ServerException('Failed to connect to the server');
    }
  }

  @override
  Future<MovieDetailResponse> getMovieDetail(int id) async {
    try {
      final response = await client
          .get(Uri.parse('$BASE_URL/movie/$id?$API_KEY'))
          .timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        return MovieDetailResponse.fromJson(json.decode(response.body));
      } else {
        throw ServerException('Failed to connect to the server');
      }
    } on SocketException {
      throw ServerException('Failed to connect to the server');
    } on TimeoutException {
      throw ServerException('Failed to connect to the server');
    } on FormatException {
      throw ServerException('Failed to connect to the server');
    }
  }

  @override
  Future<List<MovieModel>> getMovieRecommendations(int id) async {
    try {
      final response = await client
          .get(Uri.parse('$BASE_URL/movie/$id/recommendations?$API_KEY'))
          .timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        return MovieResponse.fromJson(json.decode(response.body)).movieList;
      } else {
        throw ServerException('Failed to connect to the server');
      }
    } on SocketException {
      throw ServerException('Failed to connect to the server');
    } on TimeoutException {
      throw ServerException('Failed to connect to the server');
    } on FormatException {
      throw ServerException('Failed to connect to the server');
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final response = await client
          .get(Uri.parse('$BASE_URL/movie/popular?$API_KEY'))
          .timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        return MovieResponse.fromJson(json.decode(response.body)).movieList;
      } else {
        throw ServerException('Failed to connect to the server');
      }
    } on SocketException {
      throw ServerException('Failed to connect to the server');
    } on TimeoutException {
      throw ServerException('Failed to connect to the server');
    } on FormatException {
      throw ServerException('Failed to connect to the server');
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    try {
      final response = await client
          .get(Uri.parse('$BASE_URL/movie/top_rated?$API_KEY'))
          .timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        return MovieResponse.fromJson(json.decode(response.body)).movieList;
      } else {
        throw ServerException('Failed to connect to the server');
      }
    } on SocketException {
      throw ServerException('Failed to connect to the server');
    } on TimeoutException {
      throw ServerException('Failed to connect to the server');
    } on FormatException {
      throw ServerException('Failed to connect to the server');
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    try {
      final response = await client
          .get(Uri.parse('$BASE_URL/search/movie?$API_KEY&query=$query'))
          .timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        return MovieResponse.fromJson(json.decode(response.body)).movieList;
      } else {
        throw ServerException('Failed to connect to the server');
      }
    } on SocketException {
      throw ServerException('Failed to connect to the server');
    } on TimeoutException {
      throw ServerException('Failed to connect to the server');
    } on FormatException {
      throw ServerException('Failed to connect to the server');
    }
  }
}
