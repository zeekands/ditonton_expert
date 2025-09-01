abstract class SettingsRepository {
  Future<bool> checkOnboardingStatus();
  Future<void> setOnboardingStatus(bool status);
}
