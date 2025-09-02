import 'package:core/common/constants.dart';
import 'package:core/common/content.dart';
import 'package:core/common/content_type.dart';
import 'package:feature_watchlist/presentation/cubit/watchlist_cubit.dart';
import 'package:feature_watchlist/presentation/cubit/watchlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_ui/widget/content_card.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});

  @override
  _WatchlistPageState createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<WatchlistCubit>().fetchWatchlist());
  }

  @override
  void didPopNext() {
    super.didPopNext();
    context.read<WatchlistCubit>().fetchWatchlist();
  }

  Future<void> _onContentTap(BuildContext context, Content content) async {
    if (content.contentType == ContentType.movie) {
      final value = await context.push('${RoutePaths.movies}/${content.id}');
      if (value == null) {
        await context.read<WatchlistCubit>().fetchWatchlist();
      }
    } else if (content.contentType == ContentType.tvSeries) {
      final value = await context.push('${RoutePaths.tv}/${content.id}');
      if (value == null) {
        await context.read<WatchlistCubit>().fetchWatchlist();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Watchlist')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<WatchlistCubit, WatchlistState>(
          builder: (context, state) {
            return state.when(
              initial: () => SizedBox.shrink(),
              loading: () => Center(child: CircularProgressIndicator()),
              loaded: (watchlist) {
                if (watchlist.isEmpty) {
                  return Center(
                    key: Key('empty_message'),
                    child: Text('Your watchlist is empty'),
                  );
                }
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final content = watchlist[index];
                    return ContentCard(
                      content: content,
                      onTap: () => _onContentTap(context, content),
                    );
                  },
                  itemCount: watchlist.length,
                );
              },
              error: (message) =>
                  Center(key: Key('error_message'), child: Text(message)),
            );
          },
        ),
      ),
    );
  }
}
