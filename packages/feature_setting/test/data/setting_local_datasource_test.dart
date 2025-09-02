import 'package:feature_setting/data/datasource/setting_local_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SettingsLocalDataSourceImpl dataSource;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    dataSource = SettingsLocalDataSourceImpl(sharedPreferences: prefs);
  });

  test('getOnboardingStatus returns false by default', () async {
    final result = await dataSource.getOnboardingStatus();
    expect(result, false);
  });

  test('setOnboardingStatus saves and retrievable', () async {
    await dataSource.setOnboardingStatus(true);
    final result = await dataSource.getOnboardingStatus();
    expect(result, true);
  });
}

