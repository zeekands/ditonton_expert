import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('about_page'),
      appBar: AppBar(title: Text('About')),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  color: Color(0xFF081F32),
                  child: Center(
                    child: Image.asset(
                      "packages/feature_about/assets/circle-g.png",
                      width: 128,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32.0),
                  color: Color(0xFFF9E79F),
                  child: Text(
                    'Ditonton merupakan sebuah aplikasi katalog film yang dikembangkan oleh Dicoding Indonesia sebagai contoh proyek aplikasi untuk kelas Menjadi Flutter Developer Expert.',
                    style: TextStyle(color: Colors.black87, fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
