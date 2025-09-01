// features/movie_feature/presentation/cubit/now_playing_movies/now_playing_movies_cubit.dart

import 'package:feature_tv_series/domain/usecases/get_now_playing_tv_series.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'now_playing_tv_series_state.dart';

class NowPlayingTvSeriesCubit extends Cubit<NowPlayingTvSeriesState> {
  final GetNowPlayingTvSeriesUseCase getNowPlaying;

  NowPlayingTvSeriesCubit({required this.getNowPlaying})
    : super(const NowPlayingTvSeriesState.initial());

  Future<void> fetchNowPlayingTvSeries() async {
    emit(const NowPlayingTvSeriesState.loading());
    final result = await getNowPlaying.execute();

    result.fold(
      (failure) =>
          emit(NowPlayingTvSeriesState.error(message: failure.message)),
      (tvSeries) => emit(NowPlayingTvSeriesState.loaded(tvSeries: tvSeries)),
    );
  }
}
