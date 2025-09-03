import 'package:firebase_analytics/firebase_analytics.dart';

class Analytics {
  static Future<void> safeLogEvent({required String name, Map<String, Object>? parameters}) async {
    try {
      final analytics = FirebaseAnalytics.instance;
      await analytics.logEvent(name: name, parameters: parameters);
    } catch (_) {
      // Swallow in tests or when Firebase isn't initialized
    }
  }

  static Future<void> safeLogSearch(String searchTerm) async {
    await safeLogEvent(name: 'search', parameters: {'search_term': searchTerm});
  }

  static Future<void> safeLogAppOpen() async {
    await safeLogEvent(name: 'app_open');
  }

  static Future<void> safeSetCollectionEnabled(bool enabled) async {
    try {
      final analytics = FirebaseAnalytics.instance;
      await analytics.setAnalyticsCollectionEnabled(enabled);
    } catch (_) {}
  }
}
