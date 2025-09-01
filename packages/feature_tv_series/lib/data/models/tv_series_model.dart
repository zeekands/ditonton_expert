import 'package:equatable/equatable.dart';
import 'package:feature_tv_series/domain/entities/tv_series.dart';

class TvSeriesModel extends Equatable {
  const TvSeriesModel({
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.name,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
    required this.episodeRunTime,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
  });

  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String name;
  final String originalName;
  final String overview;
  final double popularity;
  final String? posterPath;
  final String? firstAirDate;
  final double voteAverage;
  final int voteCount;
  final List<int> episodeRunTime;
  final int numberOfEpisodes;
  final int numberOfSeasons;

  factory TvSeriesModel.fromJson(Map<String, dynamic> json) => TvSeriesModel(
    backdropPath: json["backdrop_path"] ?? '',
    genreIds: List<int>.from(json["genre_ids"]?.map((x) => x) ?? []),
    id: json["id"],
    name: json["name"],
    originalName: json["original_name"],
    overview: json["overview"],
    popularity: json["popularity"]?.toDouble() ?? 0.0,
    posterPath: json["poster_path"] ?? '',
    firstAirDate: json["first_air_date"] ?? '',
    voteAverage: json["vote_average"]?.toDouble() ?? 0.0,
    voteCount: json["vote_count"] ?? 0,
    episodeRunTime: List<int>.from(
      json["episode_run_time"]?.map((x) => x) ?? [],
    ),
    numberOfEpisodes: json["number_of_episodes"] ?? 0,
    numberOfSeasons: json["number_of_seasons"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "backdrop_path": backdropPath,
    "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    "id": id,
    "name": name,
    "original_name": originalName,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "first_air_date": firstAirDate,
    "vote_average": voteAverage,
    "vote_count": voteCount,
    "episode_run_time": List<dynamic>.from(episodeRunTime.map((x) => x)),
    "number_of_episodes": numberOfEpisodes,
    "number_of_seasons": numberOfSeasons,
  };

  TvSeries toEntity() {
    return TvSeries(
      backdropPath: backdropPath,
      genreIds: genreIds,
      id: id,
      name: name,
      originalName: originalName,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      firstAirDate: firstAirDate,
      voteAverage: voteAverage,
      voteCount: voteCount,
      episodeRunTime: episodeRunTime,
      numberOfEpisodes: numberOfEpisodes,
      numberOfSeasons: numberOfSeasons,
    );
  }

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
    voteAverage,
    voteCount,
  ];
}
