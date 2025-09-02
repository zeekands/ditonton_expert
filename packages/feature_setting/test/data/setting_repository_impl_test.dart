import 'package:feature_setting/data/datasource/setting_local_datasource.dart';
import 'package:feature_setting/data/repository/setting_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'setting_repository_impl_test.mocks.dart';

@GenerateMocks([SettingsLocalDataSource])
void main() {
  late SettingsRepositoryImpl repo;
  late MockSettingsLocalDataSource mockLocal;

  setUp(() {
    mockLocal = MockSettingsLocalDataSource();
    repo = SettingsRepositoryImpl(localDataSource: mockLocal);
  });

  test('checkOnboardingStatus delegates to local datasource', () async {
    when(mockLocal.getOnboardingStatus()).thenAnswer((_) async => true);
    final result = await repo.checkOnboardingStatus();
    expect(result, true);
  });

  test('setOnboardingStatus delegates to local datasource', () async {
    when(mockLocal.setOnboardingStatus(true))
        .thenAnswer((_) async => Future.value());
    await repo.setOnboardingStatus(true);
    verify(mockLocal.setOnboardingStatus(true)).called(1);
  });
}

