import 'package:core/common/content_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ContentType values', () {
    expect(ContentType.movie, 'movie');
    expect(ContentType.tvSeries, 'tv');
  });
}

