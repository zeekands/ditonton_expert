import 'package:core/data/models/genre_model.dart';
import 'package:equatable/equatable.dart';
import 'package:feature_tv_series/domain/entities/tv_series_detail.dart';

class TvSeriesDetailResponse extends Equatable {
  const TvSeriesDetailResponse({
    required this.backdropPath,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.originalLanguage,
    required this.name,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.episodeRunTime,
    required this.numberOfEpisodes,
    required this.numberOfSeasons, // Properti baru
    required this.status,
    required this.tagline,
    required this.voteAverage,
    required this.voteCount,
  });

  final String? backdropPath;
  final List<GenreModel> genres;
  final String homepage;
  final int id;
  final String originalLanguage;
  final String name;
  final String overview;
  final double popularity;
  final String posterPath;
  final String firstAirDate;
  final List<int> episodeRunTime;
  final int numberOfEpisodes;
  final int numberOfSeasons; // Deklarasi properti
  final String status;
  final String tagline;
  final double voteAverage;
  final int voteCount;

  factory TvSeriesDetailResponse.fromJson(Map<String, dynamic> json) =>
      TvSeriesDetailResponse(
        backdropPath: json["backdrop_path"],
        genres: List<GenreModel>.from(
            json["genres"].map((x) => GenreModel.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        originalLanguage: json["original_language"],
        name: json["name"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        firstAirDate: json["first_air_date"],
        episodeRunTime: List<int>.from(
            (json["episode_run_time"] as List?)?.map((x) => x) ?? []),
        numberOfEpisodes: json["number_of_episodes"],
        numberOfSeasons: json["number_of_seasons"],
        status: json["status"],
        tagline: json["tagline"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "original_language": originalLanguage,
        "name": name,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "first_air_date": firstAirDate,
        "episode_run_time": List<dynamic>.from(episodeRunTime.map((x) => x)),
        "number_of_episodes": numberOfEpisodes,
        "number_of_seasons": numberOfSeasons,
        "status": status,
        "tagline": tagline,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };

  TvSeriesDetail toEntity() {
    return TvSeriesDetail(
      backdropPath: backdropPath,
      genres: genres.map((genre) => genre.toEntity()).toList(),
      id: id,
      originalName: name,
      overview: overview,
      posterPath: posterPath,
      firstAirDate: firstAirDate,
      episodeRunTime: episodeRunTime,
      numberOfEpisodes: numberOfEpisodes,
      numberOfSeasons: numberOfSeasons, // Memasukkan data ke entitas
      name: name,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

  @override
  List<Object?> get props => [
        backdropPath,
        genres,
        homepage,
        id,
        originalLanguage,
        name,
        overview,
        popularity,
        posterPath,
        firstAirDate,
        episodeRunTime,
        numberOfEpisodes,
        numberOfSeasons, // Tambahkan ke props
        status,
        tagline,
        voteAverage,
        voteCount,
      ];
}
