import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class CustomHttpClient {
  Future<http.Client> createIOClient() async {
    // Use an isolated context so we don't affect global defaults
    final SecurityContext context = SecurityContext();
    try {
      // Pin to the TMDB certificate chain (includes leaf + intermediates/roots)
      final ByteData data = await rootBundle.load('assets/tmdb_cert_chain.pem');
      context.setTrustedCertificatesBytes(data.buffer.asUint8List());
    } catch (e) {
      throw Exception('Failed to load TMDB certificate: $e');
    }

    final HttpClient httpClient = HttpClient(context: context);
    // Enforce hostname verification and TLS by not overriding callbacks
    return IOClient(httpClient);
  }
}
