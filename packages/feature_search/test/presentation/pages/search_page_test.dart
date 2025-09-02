import 'package:feature_search/presentation/bloc/search_bloc.dart';
import 'package:feature_search/presentation/bloc/search_state.dart';
import 'package:feature_search/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_page_test.mocks.dart';

@GenerateMocks([SearchBloc])
void main() {
  late MockSearchBloc mockBloc;

  setUp(() {
    mockBloc = MockSearchBloc();
    when(mockBloc.stream).thenAnswer((_) => const Stream<SearchState>.empty());
  });

  Widget makeTestable(Widget child) => BlocProvider<SearchBloc>.value(
        value: mockBloc,
        child: MaterialApp(home: child),
      );

  testWidgets('shows initial prompt when initial', (tester) async {
    when(mockBloc.state).thenReturn(const SearchState.initial());

    await tester.pumpWidget(makeTestable(const SearchPage()));

    expect(find.text('Silakan masukkan kata kunci pencarian'), findsOneWidget);
  });

  testWidgets('shows loading when loading', (tester) async {
    when(mockBloc.state).thenReturn(const SearchState.loading());

    await tester.pumpWidget(makeTestable(const SearchPage()));

    expect(find.byKey(const Key('loading_center')), findsOneWidget);
  });

  testWidgets('shows error message when error', (tester) async {
    when(mockBloc.state)
        .thenReturn(const SearchState.error(message: 'Oops'));

    await tester.pumpWidget(makeTestable(const SearchPage()));

    expect(find.byKey(const Key('error_message')), findsOneWidget);
  });
}

