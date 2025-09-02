import 'package:core/common/content.dart';
import 'package:core/common/content_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_ui/widget/content_card.dart';

class _FakeContent implements Content {
  final int _id;
  final String? _title;
  final String? _overview;
  final String? _posterPath;
  final String _type;

  _FakeContent({
    required int id,
    required String? title,
    required String? overview,
    required String? posterPath,
    required String type,
  })  : _id = id,
        _title = title,
        _overview = overview,
        _posterPath = posterPath,
        _type = type;

  @override
  String get contentType => _type;

  @override
  int get id => _id;

  @override
  String? get overview => _overview;

  @override
  String? get posterPath => _posterPath;

  @override
  String? get title => _title;
}

void main() {
  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

  testWidgets('ContentCard renders movie content properly and handles tap',
      (tester) async {
    var tapped = false;
    final content = _FakeContent(
      id: 1,
      title: 'A Movie',
      overview: 'A nice movie',
      posterPath: '/p.jpg',
      type: ContentType.movie,
    );

    await tester.pumpWidget(wrap(ContentCard(
      content: content,
      onTap: () => tapped = true,
    )));

    expect(find.text('A Movie'), findsOneWidget);
    expect(find.text('Movie'), findsOneWidget);
    expect(find.text('A nice movie'), findsOneWidget);

    await tester.tap(find.byType(InkWell));
    await tester.pump();
    expect(tapped, isTrue);
  });

  testWidgets('ContentCard renders TV series content properly', (tester) async {
    final content = _FakeContent(
      id: 2,
      title: 'A Show',
      overview: 'A nice show',
      posterPath: '/p2.jpg',
      type: ContentType.tvSeries,
    );

    await tester.pumpWidget(wrap(ContentCard(
      content: content,
      onTap: () {},
    )));

    expect(find.text('A Show'), findsOneWidget);
    expect(find.text('TV Series'), findsOneWidget);
    expect(find.text('A nice show'), findsOneWidget);
  });
}

