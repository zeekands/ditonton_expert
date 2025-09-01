import 'package:feature_setting/domain/repository/setting_repository.dart';

abstract class CheckOnboardingStatus {
  Future<bool> execute();
}

class CheckOnboardingStatusImpl implements CheckOnboardingStatus {
  final SettingsRepository settingsRepository;

  CheckOnboardingStatusImpl(this.settingsRepository);

  @override
  Future<bool> execute() async {
    return settingsRepository.checkOnboardingStatus();
  }
}
