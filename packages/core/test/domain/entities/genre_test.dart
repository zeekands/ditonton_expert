import 'package:core/domain/entities/genre.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Genre equatable works', () {
    const a = Genre(id: 1, name: 'Action');
    const b = Genre(id: 1, name: 'Action');
    const c = Genre(id: 2, name: 'Drama');
    expect(a, b);
    expect(a == c, false);
  });
}

