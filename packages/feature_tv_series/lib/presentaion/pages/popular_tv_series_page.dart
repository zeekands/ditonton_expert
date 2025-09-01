import 'package:feature_tv_series/presentaion/cubit/popular/popular_tv_series_cubit.dart';
import 'package:feature_tv_series/presentaion/cubit/popular/popular_tv_series_state.dart';
import 'package:feature_tv_series/presentaion/widget/tv_series_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularTvSeriesPage extends StatefulWidget {
  @override
  _PopularTvSeriesPageState createState() => _PopularTvSeriesPageState();
}

class _PopularTvSeriesPageState extends State<PopularTvSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<PopularTvSeriesCubit>().fetchPopularTvSeries(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Popular TV Series')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PopularTvSeriesCubit, PopularTvSeriesState>(
          builder: (context, state) {
            return state.when(
              initial: () => SizedBox.shrink(),
              loading: () => Center(child: CircularProgressIndicator()),
              loaded: (tvSeries) => ListView.builder(
                itemBuilder: (context, index) {
                  final tv = tvSeries[index];
                  return TvSeriesCard(tv);
                },
                itemCount: tvSeries.length,
              ),
              error: (message) =>
                  Center(key: Key('error_message'), child: Text(message)),
            );
          },
        ),
      ),
    );
  }
}
