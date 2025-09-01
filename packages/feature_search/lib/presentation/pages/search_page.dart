import 'package:core/common/constants.dart';
import 'package:feature_search/presentation/bloc/search_event.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_ui/theme.dart';
import 'package:core/common/content_type.dart';
import 'package:feature_search/presentation/bloc/search_bloc.dart';
import 'package:feature_search/presentation/bloc/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_ui/widget/content_card.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (query) {
                context.read<SearchBloc>().add(
                  SearchEvent.onQueryChanged(query: query),
                );
              },
              decoration: InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            SizedBox(height: 16),
            Text('Search Result', style: kHeading6),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                return state.when(
                  initial: () => Expanded(
                    child: Container(
                      alignment: Alignment.center,

                      child: Text('Silakan masukkan kata kunci pencarian'),
                    ),
                  ),
                  loading: () => Expanded(
                    child: Center(
                      key: Key('loading_center'),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  loaded: (result) {
                    if (result.isEmpty) {
                      return Expanded(
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text(
                            'No results found',
                            key: Key('no_result'),
                          ),
                        ),
                      );
                    }
                    return Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemBuilder: (context, index) {
                          final content = result[index];

                          return ContentCard(
                            content: content,
                            onTap: () {
                              if (content.contentType == ContentType.movie) {
                                context.push(
                                  '${RoutePaths.movies}/${content.id}',
                                );
                              } else {
                                context.push('${RoutePaths.tv}/${content.id}');
                              }
                            },
                          );
                        },
                        itemCount: result.length,
                      ),
                    );
                  },
                  error: (message) => Expanded(
                    child: Center(
                      child: Text(message, key: Key('error_message')),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
