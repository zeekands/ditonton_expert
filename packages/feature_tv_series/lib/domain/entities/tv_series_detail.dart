import 'package:core/domain/entities/genre.dart';
import 'package:equatable/equatable.dart';

class TvSeriesDetail extends Equatable {
  const TvSeriesDetail({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.name,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.firstAirDate,
    required this.episodeRunTime,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.voteAverage,
    required this.voteCount,
  });

  final String? backdropPath;
  final List<Genre> genres;
  final int id;
  final String name;
  final String originalName;
  final String overview;
  final String? posterPath;
  final String firstAirDate;
  final List<int> episodeRunTime;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final double voteAverage;
  final int voteCount;

  @override
  List<Object?> get props => [
        backdropPath,
        genres,
        id,
        name,
        originalName,
        overview,
        posterPath,
        firstAirDate,
        episodeRunTime,
        numberOfEpisodes,
        numberOfSeasons,
        voteAverage,
        voteCount,
      ];
}
