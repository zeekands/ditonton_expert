import 'package:feature_setting/domain/repository/setting_repository.dart';

abstract class SetOnboardingStatus {
  Future<void> execute(bool status);
}

class SetOnboardingStatusImpl implements SetOnboardingStatus {
  final SettingsRepository settingsRepository;

  SetOnboardingStatusImpl(this.settingsRepository);

  @override
  Future<void> execute(bool status) async {
    return settingsRepository.setOnboardingStatus(status);
  }
}
