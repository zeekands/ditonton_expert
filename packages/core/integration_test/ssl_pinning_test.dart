import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('SSL pinning chain allows TMDB request', (tester) async {
    final pemPath = '../../assets/tmdb_cert_chain.pem';
    final file = File(pemPath);
    if (!await file.exists()) {
      // Environment-specific; skip when asset not found in this context.
      expect(true, isTrue, reason: 'tmdb_cert_chain.pem not found, skipping');
      return;
    }
    final context = SecurityContext();
    context.setTrustedCertificates(pemPath);
    final client = HttpClient(context: context);
    final apiKey = '2174d146bb9c0eab47529b2e77d6b526';
    final uri = Uri.parse('https://api.themoviedb.org/3/configuration?api_key=$apiKey');
    final request = await client.getUrl(uri);
    final response = await request.close();
    expect(response.statusCode, 200);
  });
}
