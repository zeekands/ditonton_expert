import 'package:flutter_test/flutter_test.dart';
import 'package:core/data/datasources/db/database_helper.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late DatabaseHelper db;

  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  setUp(() {
    db = DatabaseHelper();
  });

  group('watchlist_movie table', () {
    const table = 'watchlist_movie';
    final map = {
      'id': 10,
      'title': 'Title',
      'overview': 'Overview',
      'posterPath': '/p.jpg',
    };

    test('insert, getById, getWatchlist, remove works', () async {
      final inserted = await db.insert(table, map);
      expect(inserted, isNonZero);

      final byId = await db.getById(table, map['id'] as int);
      expect(byId, isNotNull);
      expect(byId!['title'], 'Title');

      final list = await db.getWatchlist(table);
      expect(list, isA<List>());
      expect(list.any((e) => e['id'] == map['id']), isTrue);

      final removed = await db.remove(table, map['id'] as int);
      expect(removed, 1);
    });
  });

  group('watchlist_tv_series table', () {
    const table = 'watchlist_tv_series';
    final map = {
      'id': 20,
      'name': 'Name',
      'overview': 'Overview',
      'posterPath': '/p2.jpg',
    };

    test('insert, getById, getWatchlist, remove works', () async {
      final inserted = await db.insert(table, map);
      expect(inserted, isNonZero);

      final byId = await db.getById(table, map['id'] as int);
      expect(byId, isNotNull);
      expect(byId!['name'], 'Name');

      final list = await db.getWatchlist(table);
      expect(list, isA<List>());
      expect(list.any((e) => e['id'] == map['id']), isTrue);

      final removed = await db.remove(table, map['id'] as int);
      expect(removed, 1);
    });
  });
}
