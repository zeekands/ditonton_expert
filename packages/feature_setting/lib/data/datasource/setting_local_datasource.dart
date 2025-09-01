import 'package:core/common/exception.dart' show DatabaseException;
import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingsLocalDataSource {
  Future<bool> getOnboardingStatus();
  Future<void> setOnboardingStatus(bool status);
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  final SharedPreferences sharedPreferences;
  SettingsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> getOnboardingStatus() async {
    try {
      return sharedPreferences.getBool('onboarding_completed') ?? false;
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<void> setOnboardingStatus(bool status) async {
    try {
      await sharedPreferences.setBool('onboarding_completed', status);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
