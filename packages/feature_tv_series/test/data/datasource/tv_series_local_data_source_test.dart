import 'package:core/common/exception.dart';
import 'package:core/data/datasources/db/database_helper.dart';
import 'package:feature_tv_series/data/datasources/tv_series_local_data_source.dart';
import 'package:feature_tv_series/data/models/tv_series_table.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart' show Database;

class FakeDatabaseHelper implements DatabaseHelper {
  final Map<String, Map<int, Map<String, dynamic>>> _tables = {};
  bool throwOnInsert = false;
  bool throwOnRemove = false;

  @override
  Future<int> insert(String tableName, Map<String, dynamic> data) async {
    if (throwOnInsert) throw Exception('insert error');
    _tables.putIfAbsent(tableName, () => {});
    _tables[tableName]![data['id'] as int] = data;
    return 1;
  }

  @override
  Future<int> remove(String tableName, int id) async {
    if (throwOnRemove) throw Exception('remove error');
    final table = _tables[tableName];
    if (table == null) return 0;
    table.remove(id);
    return 1;
  }

  @override
  Future<Map<String, dynamic>?> getById(String tableName, int id) async {
    final table = _tables[tableName];
    return table?[id];
  }

  @override
  Future<List<Map<String, dynamic>>> getWatchlist(String tableName) async {
    final table = _tables[tableName];
    if (table == null) return [];
    return table.values.toList();
  }

  // Unused in tests; satisfy interface
  @override
  Future<Database?> get database => Future.value(null);
}

void main() {
  late TvSeriesLocalDataSourceImpl dataSource;
  late FakeDatabaseHelper mockDatabaseHelper;
  const tableName = 'watchlist_tv_series';

  const testTvSeriesTable = TvSeriesTable(
    id: 1,
    name: 'name',
    overview: 'overview',
    posterPath: 'posterPath',
  );

  const testTvSeriesMap = {
    'id': 1,
    'name': 'name',
    'overview': 'overview',
    'posterPath': 'posterPath',
  };

  setUp(() {
    mockDatabaseHelper = FakeDatabaseHelper();
    dataSource =
        TvSeriesLocalDataSourceImpl(databaseHelper: mockDatabaseHelper);
  });

  group('save watchlist tv series', () {
    test('should return success message when insert to database is success',
        () async {
      // arrange
      // no-op: FakeDatabaseHelper returns success by default
      // act
      final result =
          await dataSource.insertWatchlistTvSeries(testTvSeriesTable);
      // assert
      expect(result, 'Added to Watchlist');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      mockDatabaseHelper.throwOnInsert = true;
      // act
      final call = dataSource.insertWatchlistTvSeries(testTvSeriesTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove watchlist tv series', () {
    test('should return success message when remove from database is success',
        () async {
      // arrange
      // no-op: FakeDatabaseHelper returns success by default
      // act
      final result =
          await dataSource.removeWatchlistTvSeries(testTvSeriesTable);
      // assert
      expect(result, 'Removed from Watchlist');
    });

    test('should throw DatabaseException when remove from database is failed',
        () async {
      // arrange
      mockDatabaseHelper.throwOnRemove = true;
      // act
      final call = dataSource.removeWatchlistTvSeries(testTvSeriesTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Get Tv Series Detail By Id', () {
    const tId = 1;

    test('should return Tv Series Detail Table when data is found', () async {
      // arrange
      await mockDatabaseHelper.insert(tableName, testTvSeriesMap);
      // act
      final result = await dataSource.getTvSeriesById(tId);
      // assert
      expect(result, testTvSeriesTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      // ensure table empty
      // act
      final result = await dataSource.getTvSeriesById(tId);
      // assert
      expect(result, null);
    });
  });

  group('get watchlist tv series', () {
    test('should return list of TvSeriesTable from database', () async {
      // arrange
      await mockDatabaseHelper.insert(tableName, testTvSeriesMap);
      // act
      final result = await dataSource.getWatchlistTvSeries();
      // assert
      expect(result, [testTvSeriesTable]);
    });
  });
}
