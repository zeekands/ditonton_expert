import 'package:core/common/content.dart';
import 'package:core/common/content_type.dart';
import 'package:equatable/equatable.dart';

class TvSeries extends Equatable implements Content {
  const TvSeries({
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.name,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.episodeRunTime,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.voteAverage,
    required this.voteCount,
  });

  TvSeries.watchlist({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.overview,
  })  : backdropPath = null,
        genreIds = [],
        originalName = '',
        popularity = 0.0,
        firstAirDate = '',
        episodeRunTime = [],
        numberOfEpisodes = 0,
        numberOfSeasons = 0,
        voteAverage = 0.0,
        voteCount = 0;

  final String? backdropPath;
  final List<int> genreIds;
  @override
  final int id;
  final String? name;
  final String? originalName;
  @override
  final String? overview;
  final double? popularity;
  @override
  final String? posterPath;
  final String? firstAirDate;
  final List<int> episodeRunTime;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final double? voteAverage;
  final int? voteCount;

  @override
  List<Object?> get props => [
        backdropPath,
        genreIds,
        id,
        name,
        originalName,
        overview,
        popularity,
        posterPath,
        firstAirDate,
        episodeRunTime,
        numberOfEpisodes,
        numberOfSeasons,
        voteAverage,
        voteCount,
      ];

  @override
  String get contentType => ContentType.tvSeries;

  @override
  String? get title => name;
}
