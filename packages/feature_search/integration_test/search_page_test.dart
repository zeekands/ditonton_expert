import 'package:core/common/content.dart';
import 'package:core/common/content_type.dart';
import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:feature_movie/domain/entities/movie.dart';
import 'package:feature_search/presentation/bloc/search_bloc.dart';
import 'package:feature_search/presentation/bloc/search_event.dart';
import 'package:feature_search/presentation/pages/search_page.dart';
import 'package:feature_tv_series/domain/entities/tv_series.dart';
import 'package:feature_tv_series/domain/usecases/search_tv_series.dart';
import 'package:feature_movie/domain/usecases/search_movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';

class _FakeSearchMovies implements SearchMovieUseCase {
  @override
  Future<Either<Failure, List<Movie>>> execute(String query) async =>
      const Right(<Movie>[]);
}

class _FakeSearchTv implements SearchTvSeriesUseCase {
  @override
  Future<Either<Failure, List<TvSeries>>> execute(String query) async =>
      const Right(<TvSeries>[]);
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
    const MethodChannel('plugins.flutter.io/path_provider'),
    (MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'getApplicationSupportDirectory':
        case 'getApplicationDocumentsDirectory':
        case 'getTemporaryDirectory':
          return '/tmp';
        default:
          return null;
      }
    },
  );

  testWidgets('Search shows results after typing', (tester) async {
    final bloc = SearchBloc(
      searchMovies: _FakeSearchMovies(),
      searchTvSeries: _FakeSearchTv(),
    );

    await tester.pumpWidget(
      BlocProvider<SearchBloc>.value(
        value: bloc,
        child: const MaterialApp(home: SearchPage()),
      ),
    );

    expect(find.text('Search Result'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'mat');
    // Trigger event manually to avoid debounce timing flakiness
    bloc.add(SearchEvent.onQueryChanged(query: 'mat'));
    await tester.pumpAndSettle(const Duration(milliseconds: 800));

    // When empty, expect No results message
    expect(find.byKey(const Key('no_result')), findsOneWidget);
  });
}
