import 'package:core/data/datasources/db/database_helper.dart'; 
import 'package:core/common/exception.dart';
import 'package:feature_movie/data/models/movie_table.dart';

abstract class MovieLocalDataSource {
  Future<String> insertWatchlistMovie(MovieTable movie);
  Future<String> removeWatchlistMovie(MovieTable movie);
  Future<MovieTable?> getMovieById(int id);
  Future<List<MovieTable>> getWatchlistMovies();
}

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  final DatabaseHelper databaseHelper;
  static const String _tableName = 'watchlist_movie';

  MovieLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<String> insertWatchlistMovie(MovieTable movie) async {
    try {
      await databaseHelper.insert(_tableName, movie.toJson());
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlistMovie(MovieTable movie) async {
    try {
      await databaseHelper.remove(_tableName, movie.id);
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<MovieTable?> getMovieById(int id) async {
    final result = await databaseHelper.getById(_tableName, id);
    if (result != null) {
      return MovieTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<MovieTable>> getWatchlistMovies() async {
    final result = await databaseHelper.getWatchlist(_tableName);
    return result.map((data) => MovieTable.fromMap(data)).toList();
  }
}
