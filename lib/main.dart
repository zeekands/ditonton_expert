import 'package:ditonton_expert/di.dart' as di;
import 'package:ditonton_expert/router.dart';
import 'package:feature_movie/presentation/cubit/detail/movie_detail_cubit.dart';
import 'package:feature_movie/presentation/cubit/now_playing/now_playing_movies_cubit.dart';
import 'package:feature_movie/presentation/cubit/popular/popular_movies_cubit.dart';
import 'package:feature_movie/presentation/cubit/top_rated/top_rated_movies_cubit.dart';
import 'package:feature_search/presentation/bloc/search_bloc.dart';
import 'package:feature_tv_series/presentaion/cubit/detail/detail_tv_series_cubit.dart';
import 'package:feature_tv_series/presentaion/cubit/now_playing/now_playing_tv_series_cubit.dart';
import 'package:feature_tv_series/presentaion/cubit/popular/popular_tv_series_cubit.dart';
import 'package:feature_tv_series/presentaion/cubit/top_rated/top_rated_tv_series_cubit.dart';
import 'package:feature_watchlist/presentation/cubit/watchlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_ui/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<NowPlayingMoviesCubit>()),
        BlocProvider(create: (_) => di.locator<PopularMoviesCubit>()),
        BlocProvider(create: (_) => di.locator<TopRatedMoviesCubit>()),
        BlocProvider(create: (_) => di.locator<TvSeriesDetailCubit>()),
        BlocProvider(create: (_) => di.locator<NowPlayingTvSeriesCubit>()),
        BlocProvider(create: (_) => di.locator<PopularTvSeriesCubit>()),
        BlocProvider(create: (_) => di.locator<TopRatedTvSeriesCubit>()),
        BlocProvider(create: (_) => di.locator<WatchlistCubit>()),
        BlocProvider(create: (_) => di.locator<MovieDetailCubit>()),
        BlocProvider(create: (_) => di.locator<SearchBloc>()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Ditonton',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: kMikadoYellow,
            unselectedItemColor: Colors.white,
            backgroundColor: kRichBlack,
            type: BottomNavigationBarType.fixed,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
