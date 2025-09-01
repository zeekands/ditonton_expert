import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/common/constants.dart';
import 'package:feature_tv_series/domain/entities/tv_series.dart';
import 'package:feature_tv_series/presentaion/cubit/now_playing/now_playing_tv_series_cubit.dart';
import 'package:feature_tv_series/presentaion/cubit/now_playing/now_playing_tv_series_state.dart';
import 'package:feature_tv_series/presentaion/cubit/popular/popular_tv_series_cubit.dart';
import 'package:feature_tv_series/presentaion/cubit/popular/popular_tv_series_state.dart';
import 'package:feature_tv_series/presentaion/cubit/top_rated/top_rated_tv_series_cubit.dart';
import 'package:feature_tv_series/presentaion/cubit/top_rated/top_rated_tv_series_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_ui/theme.dart';

class TvSeriesContent extends StatefulWidget {
  const TvSeriesContent({super.key});

  @override
  _TvSeriesContentState createState() => _TvSeriesContentState();
}

class _TvSeriesContentState extends State<TvSeriesContent> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<NowPlayingTvSeriesCubit>().fetchNowPlayingTvSeries();
      context.read<PopularTvSeriesCubit>().fetchPopularTvSeries();
      context.read<TopRatedTvSeriesCubit>().fetchTopRatedTvSeries();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TV Series')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('On The Air', style: kHeading6),
            BlocBuilder<NowPlayingTvSeriesCubit, NowPlayingTvSeriesState>(
              builder: (context, state) {
                return state.when(
                  initial: () => SizedBox.shrink(),
                  loading: () => Center(
                    key: Key('loading_indicator_on_the_air'),
                    child: CircularProgressIndicator(),
                  ),
                  loaded: (tvSeries) => TvSeriesList(tvSeries),
                  error: (message) =>
                      Text(message, key: Key('error_message_on_the_air')),
                );
              },
            ),
            SubHeading(
              title: 'Popular TV Series',
              onTap: () {
                context.push(RoutePaths.popularTvSeries);
              },
            ),
            BlocBuilder<PopularTvSeriesCubit, PopularTvSeriesState>(
              builder: (context, state) {
                return state.when(
                  initial: () => SizedBox.shrink(),
                  loading: () => Center(
                    key: Key('loading_indicator_popular'),
                    child: CircularProgressIndicator(),
                  ),
                  loaded: (tvSeries) => TvSeriesList(tvSeries),
                  error: (message) =>
                      Text(message, key: Key('error_message_popular')),
                );
              },
            ),
            SubHeading(
              title: 'Top Rated TV Series',
              onTap: () {
                context.push(RoutePaths.topRatedTvSeries);
              },
            ),
            BlocBuilder<TopRatedTvSeriesCubit, TopRatedTvSeriesState>(
              builder: (context, state) {
                return state.when(
                  initial: () => SizedBox.shrink(),
                  loading: () => Center(
                    key: Key('loading_indicator_top_rated'),
                    child: CircularProgressIndicator(),
                  ),
                  loaded: (tvSeries) => TvSeriesList(tvSeries),
                  error: (message) =>
                      Text(message, key: Key('error_message_top_rated')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TvSeriesList extends StatelessWidget {
  final List<TvSeries> tvSeriesList;

  const TvSeriesList(this.tvSeriesList, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tvSeries = tvSeriesList[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                context.go('${RoutePaths.tv}/${tvSeries.id}');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${tvSeries.posterPath}',
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tvSeriesList.length,
      ),
    );
  }
}

class SubHeading extends StatelessWidget {
  final String title;
  final Function() onTap;

  const SubHeading({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(title, style: kHeading6, overflow: TextOverflow.ellipsis),
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}
