import 'package:feature_setting/data/datasource/setting_local_datasource.dart';
import 'package:feature_setting/domain/repository/setting_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource localDataSource;

  SettingsRepositoryImpl({required this.localDataSource});

  @override
  Future<bool> checkOnboardingStatus() async {
    return localDataSource.getOnboardingStatus();
  }

  @override
  Future<void> setOnboardingStatus(bool status) async {
    return localDataSource.setOnboardingStatus(status);
  }
}
