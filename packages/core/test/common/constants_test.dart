import 'package:core/common/constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('BASE_IMAGE_URL has expected prefix', () {
    expect(BASE_IMAGE_URL, 'https://image.tmdb.org/t/p/w500');
  });

  test('RoutePaths values are stable', () {
    expect(RoutePaths.home, '/');
    expect(RoutePaths.movies, '/movies');
    expect(RoutePaths.tv, '/tv');
    expect(RoutePaths.about, '/about');
    expect(RoutePaths.watchlist, '/watchlist');
    expect(RoutePaths.onboarding, '/onboarding');
    expect(RoutePaths.popularMovies, '/popular-movies');
    expect(RoutePaths.topRatedMovies, '/top-rated-movies');
    expect(RoutePaths.popularTvSeries, '/popular-tv-series');
    expect(RoutePaths.topRatedTvSeries, '/top-rated-tv-series');
  });
}

