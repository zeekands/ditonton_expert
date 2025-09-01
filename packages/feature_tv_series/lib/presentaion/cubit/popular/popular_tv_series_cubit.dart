import 'package:feature_tv_series/domain/usecases/get_popular_tv_series.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'popular_tv_series_state.dart';

class PopularTvSeriesCubit extends Cubit<PopularTvSeriesState> {
  final GetPopularTvSeriesUseCase getPopular;

  PopularTvSeriesCubit({required this.getPopular})
    : super(const PopularTvSeriesState.initial());

  Future<void> fetchPopularTvSeries() async {
    emit(const PopularTvSeriesState.loading());
    final result = await getPopular.execute();

    result.fold(
      (failure) => emit(PopularTvSeriesState.error(message: failure.message)),
      (tvSeries) => emit(PopularTvSeriesState.loaded(tvSeries: tvSeries)),
    );
  }
}
