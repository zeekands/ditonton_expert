import 'package:core/data/custom_http_client.dart';
import 'package:core/data/datasources/db/database_helper.dart';

import 'package:feature_movie/data/datasources/movie_local_data_source.dart';
import 'package:feature_movie/data/datasources/movie_remote_data_source.dart';
import 'package:feature_movie/data/repositories/movie_repository_impl.dart';
import 'package:feature_movie/domain/repositories/movie_repository.dart';
import 'package:feature_movie/domain/usecases/get_movie_detail.dart';
import 'package:feature_movie/domain/usecases/get_movie_recommendations.dart';
import 'package:feature_movie/domain/usecases/get_now_playing_movies.dart';
import 'package:feature_movie/domain/usecases/get_popular_movies.dart';
import 'package:feature_movie/domain/usecases/get_top_rated_movies.dart';
import 'package:feature_movie/domain/usecases/get_watchlist_movies.dart';
import 'package:feature_movie/domain/usecases/get_watchlist_status.dart';
import 'package:feature_movie/domain/usecases/remove_watchlist.dart';
import 'package:feature_movie/domain/usecases/save_watchlist.dart';
import 'package:feature_movie/domain/usecases/search_movie.dart';
import 'package:feature_movie/presentation/cubit/detail/movie_detail_cubit.dart';
import 'package:feature_movie/presentation/cubit/now_playing/now_playing_movies_cubit.dart';
import 'package:feature_movie/presentation/cubit/popular/popular_movies_cubit.dart';
import 'package:feature_movie/presentation/cubit/top_rated/top_rated_movies_cubit.dart';
import 'package:feature_search/presentation/bloc/search_bloc.dart';

import 'package:feature_tv_series/data/datasources/tv_series_local_data_source.dart';
import 'package:feature_tv_series/data/datasources/tv_series_remote_data_source.dart';
import 'package:feature_tv_series/data/repositories/tv_series_repository_impl.dart';
import 'package:feature_tv_series/domain/repositories/tv_series_repository.dart';
import 'package:feature_tv_series/domain/usecases/get_now_playing_tv_series.dart';
import 'package:feature_tv_series/domain/usecases/get_popular_tv_series.dart';
import 'package:feature_tv_series/domain/usecases/get_top_rated_tv_series.dart';
import 'package:feature_tv_series/domain/usecases/get_tv_series_detail.dart';
import 'package:feature_tv_series/domain/usecases/get_tv_series_recommendations.dart';
import 'package:feature_tv_series/domain/usecases/get_watchlist_status_tv_series.dart';
import 'package:feature_tv_series/domain/usecases/save_watchlist_tv_series.dart';
import 'package:feature_tv_series/domain/usecases/remove_watchlist_tv_series.dart';
import 'package:feature_tv_series/domain/usecases/get_watchlist_tv_series.dart';
import 'package:feature_tv_series/domain/usecases/search_tv_series.dart';
import 'package:feature_tv_series/presentaion/cubit/detail/detail_tv_series_cubit.dart';
import 'package:feature_tv_series/presentaion/cubit/now_playing/now_playing_tv_series_cubit.dart';
import 'package:feature_tv_series/presentaion/cubit/popular/popular_tv_series_cubit.dart';
import 'package:feature_tv_series/presentaion/cubit/top_rated/top_rated_tv_series_cubit.dart';

import 'package:feature_setting/data/datasource/setting_local_datasource.dart';
import 'package:feature_setting/data/repository/setting_repository_impl.dart';
import 'package:feature_setting/domain/repository/setting_repository.dart';
import 'package:feature_setting/domain/usecase/check_onboarding_status.dart';
import 'package:feature_setting/domain/usecase/set_onboarding_status.dart';
import 'package:feature_watchlist/presentation/cubit/watchlist_cubit.dart';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> init() async {
  _registerBloc();
  _registerUseCases();
  _registerRepositories();
  _registerDataSources();
  _registerExternalHelpers();
  await locator.isReady<SharedPreferences>();
  await locator.isReady<http.Client>();
}

void _registerBloc() {
  // Movie
  locator.registerFactory(
    () => NowPlayingMoviesCubit(getNowPlayingMovies: locator()),
  );
  locator.registerFactory(
    () => PopularMoviesCubit(getPopularMovies: locator()),
  );
  locator.registerFactory(
    () => TopRatedMoviesCubit(getTopRatedMovies: locator()),
  );
  locator.registerFactory(
    () => MovieDetailCubit(
      getMovieDetail: locator(),
      getMovieRecommendations: locator(),
      getWatchlistStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => SearchBloc(searchMovies: locator(), searchTvSeries: locator()),
  );

  // TV Series
  locator.registerFactory(
    () => NowPlayingTvSeriesCubit(getNowPlaying: locator()),
  );
  locator.registerFactory(() => PopularTvSeriesCubit(getPopular: locator()));
  locator.registerFactory(
    () => TopRatedTvSeriesCubit(getTopRatedTvSeries: locator()),
  );
  locator.registerFactory(
    () => TvSeriesDetailCubit(
      getTvSeriesDetail: locator(),
      getTvSeriesRecommendations: locator(),
      getWatchlistStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistCubit(
      getWatchlistMovies: locator(),
      getWatchlistTvSeries: locator(),
    ),
  );
}

void _registerUseCases() {
  // Movie
  locator.registerLazySingleton<GetNowPlayingMovies>(
    () => GetNowPlayingMoviesImpl(locator()),
  );
  locator.registerLazySingleton<GetPopularMovies>(
    () => GetPopularMoviesImpl(locator()),
  );
  locator.registerLazySingleton<GetTopRatedMovies>(
    () => GetTopRatedMoviesImpl(locator()),
  );
  locator.registerLazySingleton<SearchMovieUseCase>(
    () => SearchMovie(locator()),
  );
  locator.registerLazySingleton<GetWatchlistMovies>(
    () => GetWatchlistMoviesImpl(locator()),
  );
  locator.registerLazySingleton<GetMovieDetail>(
    () => GetMovieDetailImpl(locator()),
  );
  locator.registerLazySingleton<GetMovieRecommendations>(
    () => GetMovieRecommendationsImpl(locator()),
  );
  locator.registerLazySingleton<GetWatchlistStatus>(
    () => GetWatchlistStatusImpl(locator()),
  );
  locator.registerLazySingleton<SaveWatchlist>(
    () => SaveWatchlistImpl(locator()),
  );
  locator.registerLazySingleton<RemoveWatchlist>(
    () => RemoveWatchlistImpl(locator()),
  );

  // TV Series
  locator.registerLazySingleton<GetNowPlayingTvSeriesUseCase>(
    () => GetNowPlayingTvSeries(locator()),
  );
  locator.registerLazySingleton<GetPopularTvSeriesUseCase>(
    () => GetPopularTvSeries(locator()),
  );
  locator.registerLazySingleton<GetTopRatedTvSeriesUseCase>(
    () => GetTopRatedTvSeries(locator()),
  );
  locator.registerLazySingleton<GetTvSeriesDetailUseCase>(
    () => GetTvSeriesDetail(locator()),
  );
  locator.registerLazySingleton<GetTvSeriesRecommendationsUseCase>(
    () => GetTvSeriesRecommendations(locator()),
  );
  locator.registerLazySingleton<SearchTvSeriesUseCase>(
    () => SearchTvSeries(locator()),
  );
  locator.registerLazySingleton<GetWatchlistStatusTvSeriesUseCase>(
    () => GetWatchlistStatusTvSeries(locator()),
  );
  locator.registerLazySingleton<SaveWatchlistTvSeriesUseCase>(
    () => SaveWatchlistTvSeries(locator()),
  );
  locator.registerLazySingleton<RemoveWatchlistTvSeriesUseCase>(
    () => RemoveWatchlistTvSeries(locator()),
  );
  locator.registerLazySingleton<GetWatchlistTvSeriesUseCase>(
    () => GetWatchlistTvSeries(locator()),
  );

  // Settings
  locator.registerLazySingleton<CheckOnboardingStatus>(
    () => CheckOnboardingStatusImpl(locator()),
  );
  locator.registerLazySingleton<SetOnboardingStatus>(
    () => SetOnboardingStatusImpl(locator()),
  );
}

void _registerRepositories() {
  // Movie
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // TV Series
  locator.registerLazySingleton<TvSeriesRepository>(
    () => TvSeriesRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // Settings
  locator.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(localDataSource: locator()),
  );
}

void _registerDataSources() {
  // Movie
  locator.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(client: locator()),
  );
  locator.registerLazySingleton<MovieLocalDataSource>(
    () => MovieLocalDataSourceImpl(databaseHelper: locator()),
  );

  // TV Series
  locator.registerLazySingleton<TvSeriesRemoteDataSource>(
    () => TvSeriesRemoteDataSourceImpl(client: locator()),
  );
  locator.registerLazySingleton<TvSeriesLocalDataSource>(
    () => TvSeriesLocalDataSourceImpl(databaseHelper: locator()),
  );

  // Settings
  locator.registerLazySingleton<SettingsLocalDataSource>(
    () => SettingsLocalDataSourceImpl(sharedPreferences: locator()),
  );
}

void _registerExternalHelpers() {
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  locator.registerLazySingletonAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
  );
  locator.registerSingletonAsync<http.Client>(() async {
    return CustomHttpClient().createIOClient();
  });
}
