import 'package:core/domain/usecases/no_params.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('NoParams equatable empty props', () {
    final a = NoParams();
    final b = NoParams();
    expect(a, b);
  });
}

