// features/tv_series_feature/presentation/cubit/top_rated_tv_series/top_rated_tv_series_cubit.dart

import 'package:feature_tv_series/domain/usecases/get_top_rated_tv_series.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'top_rated_tv_series_state.dart';

class TopRatedTvSeriesCubit extends Cubit<TopRatedTvSeriesState> {
  final GetTopRatedTvSeriesUseCase getTopRatedTvSeries;

  TopRatedTvSeriesCubit({required this.getTopRatedTvSeries})
    : super(const TopRatedTvSeriesState.initial());

  Future<void> fetchTopRatedTvSeries() async {
    emit(const TopRatedTvSeriesState.loading());
    final result = await getTopRatedTvSeries.execute();

    result.fold(
      (failure) => emit(TopRatedTvSeriesState.error(message: failure.message)),
      (tvSeries) => emit(TopRatedTvSeriesState.loaded(tvSeries: tvSeries)),
    );
  }
}
