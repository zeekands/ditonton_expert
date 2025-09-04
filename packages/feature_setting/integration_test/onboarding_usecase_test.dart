import 'package:feature_setting/data/datasource/setting_local_datasource.dart';
import 'package:feature_setting/data/repository/setting_repository_impl.dart';
import 'package:feature_setting/domain/usecase/check_onboarding_status.dart';
import 'package:feature_setting/domain/usecase/set_onboarding_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Onboarding status can be set and read', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    final local = SettingsLocalDataSourceImpl(sharedPreferences: prefs);
    final repo = SettingsRepositoryImpl(localDataSource: local);
    final setOnboarding = SetOnboardingStatusImpl(repo);
    final checkOnboarding = CheckOnboardingStatusImpl(repo);

    expect(await checkOnboarding.execute(), false);
    await setOnboarding.execute(true);
    expect(await checkOnboarding.execute(), true);
  });
}

