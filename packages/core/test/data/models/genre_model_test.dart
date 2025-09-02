import 'package:core/data/models/genre_model.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('fromJson/toJson roundtrip and toEntity', () {
    final json = {'id': 1, 'name': 'Action'};
    final model = GenreModel.fromJson(json);
    expect(model.toJson(), json);
    expect(model.toEntity(), const Genre(id: 1, name: 'Action'));
  });
}

