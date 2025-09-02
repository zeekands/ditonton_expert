import 'package:core/common/exception.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ServerException holds message', () {
    final e = ServerException('oops');
    expect(e.message, 'oops');
  });

  test('DatabaseException holds message', () {
    final e = DatabaseException('db');
    expect(e.message, 'db');
  });
}

