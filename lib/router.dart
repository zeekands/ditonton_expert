import 'package:core/common/constants.dart';
import 'package:feature_about/about_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:feature_movie/presentation/pages/popular/popular_movie_page.dart';
import 'package:feature_movie/presentation/pages/top_rated/top_rated_movie_page.dart';
import 'package:feature_search/router.dart';
import 'package:feature_setting/domain/usecase/check_onboarding_status.dart';
import 'package:feature_setting/domain/usecase/set_onboarding_status.dart';
import 'package:feature_tv_series/presentaion/cubit/detail/detail_tv_series_cubit.dart';
import 'package:feature_tv_series/presentaion/pages/detail_tv_series_page.dart';
import 'package:feature_tv_series/presentaion/pages/popular_tv_series_page.dart';
import 'package:feature_tv_series/presentaion/pages/top_rated_tv_series_page.dart';
import 'package:feature_tv_series/presentaion/pages/tv_series_page.dart';
import 'package:feature_watchlist/presentation/cubit/watchlist_cubit.dart';
import 'package:feature_watchlist/presentation/pages/watchlist_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';
import 'package:feature_movie/presentation/cubit/detail/movie_detail_cubit.dart';
import 'package:feature_movie/presentation/pages/detail/movie_detail_page.dart';
import 'package:feature_movie/presentation/pages/movie_list/movie_list_page.dart';

import 'package:flutter/material.dart';

List<NavigatorObserver> _buildAnalyticsObservers() {
  try {
    return [FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)];
  } catch (_) {
    return const <NavigatorObserver>[];
  }
}

final router = GoRouter(
  observers: _buildAnalyticsObservers(),
  initialLocation: RoutePaths.home,
  routes: [
    GoRoute(
      path: RoutePaths.home,
      redirect: (context, state) => RoutePaths.movies,
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
              BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'TV Series'),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.watch_later),
                label: 'Watchlist',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: 'About',
              ),
            ],
            currentIndex: navigationShell.currentIndex,
            onTap: (index) {
              if (index == 3) {
                context.read<WatchlistCubit>().fetchWatchlist();
              }
              navigationShell.goBranch(index);
            },
          ),
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.movies,
              builder: (context, state) => MovieContent(),
              routes: [
                GoRoute(
                  path: ':id',
                  builder: (context, state) {
                    final id = int.parse(state.pathParameters['id']!);
                    return BlocProvider(
                      create: (context) => GetIt.I<MovieDetailCubit>(),
                      child: MovieDetailPage(id: id),
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: RoutePaths.topRatedMovies,
              builder: (context, state) => TopRatedMoviesPage(),
            ),
            GoRoute(
              path: RoutePaths.popularMovies,
              builder: (context, state) => PopularMoviesPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.tv,
              builder: (context, state) => TvSeriesContent(),
              routes: [
                GoRoute(
                  path: ':id',
                  builder: (context, state) {
                    final id = int.parse(state.pathParameters['id']!);
                    return BlocProvider(
                      create: (context) => GetIt.I<TvSeriesDetailCubit>(),
                      child: TvSeriesDetailPage(id: id),
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: RoutePaths.popularTvSeries,
              builder: (context, state) => PopularTvSeriesPage(),
            ),
            GoRoute(
              path: RoutePaths.topRatedTvSeries,
              builder: (context, state) => TopRatedTvSeriesPage(),
            ),
          ],
        ),
        StatefulShellBranch(routes: searchRoutes),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.watchlist,
              builder: (context, state) => WatchlistPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.about,
              builder: (context, state) => AboutPage(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: RoutePaths.onboarding,
      builder: (context, state) => Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              final setOnboardingStatus = GetIt.I<SetOnboardingStatus>();
              await setOnboardingStatus.execute(true);
              if (context.mounted) {
                context.go(RoutePaths.movies);
              }
            },
            child: Text('Complete Onboarding'),
          ),
        ),
      ),
    ),
  ],
  redirect: (context, state) async {
    final checkStatus = GetIt.I<CheckOnboardingStatus>();
    final result = await checkStatus.execute();
    if (!result) {
      return RoutePaths.onboarding;
    }
    return null;
  },
);

// final router = GoRouter(
//   initialLocation: '/',
//   routes: [
//     GoRoute(path: '/', redirect: (context, state) => 'RoutePaths.movies'),
//     StatefulShellRoute.indexedStack(
//       builder: (context, state, navigationShell) {
//         return Scaffold(
//           body: navigationShell,
//           bottomNavigationBar: BottomNavigationBar(
//             items: const <BottomNavigationBarItem>[
//               BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
//               BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'TV Series'),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.search),
//                 label: 'Search',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.watch_later),
//                 label: 'Watchlist',
//               ),
//             ],
//             currentIndex: navigationShell.currentIndex,
//             onTap: (index) {
//               if (index == 3) {
//                 context.read<WatchlistCubit>().fetchWatchlist();
//               }
//               navigationShell.goBranch(index);
//             },
//           ),
//         );
//       },
//       branches: [
//         StatefulShellBranch(
//           routes: [
//             GoRoute(
//               path: 'RoutePaths.movies',
//               builder: (context, state) => MovieContent(),
//               routes: [
//                 GoRoute(
//                   path: ':id',
//                   builder: (context, state) {
//                     final id = int.parse(state.pathParameters['id']!);
//                     return BlocProvider(
//                       create: (context) => GetIt.I<MovieDetailCubit>(),
//                       child: MovieDetailPage(id: id),
//                     );
//                   },
//                 ),
//               ],
//             ),
//             GoRoute(
//               path: '/top-rated-movies',
//               builder: (context, state) => TopRatedMoviesPage(),
//             ),
//             GoRoute(
//               path: '/popular-movies',
//               builder: (context, state) => PopularMoviesPage(),
//             ),
//           ],
//         ),
//         StatefulShellBranch(
//           routes: [
//             GoRoute(
//               path: '/tv',
//               builder: (context, state) => TvSeriesContent(),
//               routes: [
//                 GoRoute(
//                   path: ':id',
//                   builder: (context, state) {
//                     final id = int.parse(state.pathParameters['id']!);
//                     return BlocProvider(
//                       create: (context) => GetIt.I<TvSeriesDetailCubit>(),
//                       child: TvSeriesDetailPage(id: id),
//                     );
//                   },
//                 ),
//               ],
//             ),
//             GoRoute(
//               path: '/popular-tv-series',
//               builder: (context, state) => PopularTvSeriesPage(),
//             ),
//             GoRoute(
//               path: '/top-rated-tv-series',
//               builder: (context, state) => TopRatedTvSeriesPage(),
//             ),
//           ],
//         ),
//         StatefulShellBranch(routes: searchRoutes),
//         StatefulShellBranch(
//           routes: [
//             GoRoute(
//               path: '/watchlist',
//               builder: (context, state) => WatchlistPage(),
//             ),
//           ],
//         ),
//       ],
//     ),
//     GoRoute(
//       path: '/onboarding',
//       builder: (context, state) => Scaffold(
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () async {
//               final setOnboardingStatus = GetIt.I<SetOnboardingStatus>();
//               await setOnboardingStatus.execute(true);
//               if (context.mounted) {
//                 context.go('RoutePaths.movies');
//               }
//             },
//             child: Text('Complete Onboarding'),
//           ),
//         ),
//       ),
//     ),
//   ],
//   redirect: (context, state) async {
//     final checkStatus = GetIt.I<CheckOnboardingStatus>();
//     final result = await checkStatus.execute();

//     if (!result) {
//       return '/onboarding';
//     }
//     return null;
//   },
// );
