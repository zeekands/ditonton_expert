import 'package:feature_setting/domain/repository/setting_repository.dart';
import 'package:feature_setting/domain/usecase/check_onboarding_status.dart';
import 'package:feature_setting/domain/usecase/set_onboarding_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'check_set_onboarding_status_test.mocks.dart';

@GenerateMocks([SettingsRepository])
void main() {
  late MockSettingsRepository mockRepo;
  late CheckOnboardingStatusImpl checkUsecase;
  late SetOnboardingStatusImpl setUsecase;

  setUp(() {
    mockRepo = MockSettingsRepository();
    checkUsecase = CheckOnboardingStatusImpl(mockRepo);
    setUsecase = SetOnboardingStatusImpl(mockRepo);
  });

  test('check executes repository', () async {
    when(mockRepo.checkOnboardingStatus()).thenAnswer((_) async => true);
    final res = await checkUsecase.execute();
    expect(res, true);
  });

  test('set executes repository', () async {
    when(mockRepo.setOnboardingStatus(true))
        .thenAnswer((_) async => Future.value());
    await setUsecase.execute(true);
    verify(mockRepo.setOnboardingStatus(true)).called(1);
  });
}

