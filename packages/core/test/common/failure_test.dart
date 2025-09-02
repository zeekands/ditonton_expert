import 'package:core/common/failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('failure equality holds on message', () {
    const a = ServerFailure('x');
    const b = ServerFailure('x');
    const c = DatabaseFailure('y');
    expect(a, b);
    expect(a == c, false);
  });
}

