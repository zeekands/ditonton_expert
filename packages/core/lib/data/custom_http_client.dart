import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class CustomHttpClient {
  Future<http.Client> createIOClient() async {
    final securityContext = SecurityContext.defaultContext;
    try {
      final ByteData data = await rootBundle.load('assets/tmdb_cert_chain.pem');
      securityContext.setTrustedCertificatesBytes(data.buffer.asUint8List());
    } catch (e) {
      throw Exception('Failed to load TMDB certificate: $e');
    }
    return IOClient(HttpClient(context: securityContext));
  }
}
