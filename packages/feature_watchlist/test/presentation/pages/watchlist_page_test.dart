import 'package:feature_watchlist/presentation/cubit/watchlist_cubit.dart';
import 'package:feature_watchlist/presentation/cubit/watchlist_state.dart';
import 'package:feature_watchlist/presentation/pages/watchlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'watchlist_page_test.mocks.dart';

@GenerateMocks([WatchlistCubit])
void main() {
  late MockWatchlistCubit mockCubit;

  setUp(() {
    mockCubit = MockWatchlistCubit();
    when(mockCubit.stream)
        .thenAnswer((_) => const Stream<WatchlistState>.empty());
    when(mockCubit.fetchWatchlist())
        .thenAnswer((_) async => Future<void>.value());
  });

  Widget makeTestable(Widget child) => BlocProvider<WatchlistCubit>.value(
        value: mockCubit,
        child: MaterialApp(home: child),
      );

  testWidgets('shows progress when loading', (tester) async {
    when(mockCubit.state).thenReturn(const WatchlistState.loading());

    await tester.pumpWidget(makeTestable(const WatchlistPage()));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(Center), findsOneWidget);
  });

  testWidgets('shows empty message when loaded with empty', (tester) async {
    when(mockCubit.state).thenReturn(const WatchlistState.loaded(watchlist: []));

    await tester.pumpWidget(makeTestable(const WatchlistPage()));

    expect(find.byKey(const Key('empty_message')), findsOneWidget);
  });

  testWidgets('shows error center when error', (tester) async {
    when(mockCubit.state)
        .thenReturn(const WatchlistState.error(message: 'Oops'));

    await tester.pumpWidget(makeTestable(const WatchlistPage()));

    expect(find.byKey(const Key('error_message')), findsOneWidget);
  });
}

