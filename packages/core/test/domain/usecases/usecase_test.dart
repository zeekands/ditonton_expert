import 'package:core/common/failure.dart';
import 'package:core/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

class _DoubleUsecase extends UseCase<int, int> {
  @override
  Future<Either<Failure, int>> execute(int params) async {
    return Right(params * 2);
  }
}

void main() {
  test('UseCase execute returns Right', () async {
    final usecase = _DoubleUsecase();
    final res = await usecase.execute(4);
    expect(res, const Right(8));
  });
}

