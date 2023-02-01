import 'package:movies_app/features/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.backdropPath,
      required super.posterPath,
      required super.id,
      required super.title,
      required super.voteAverage,
      required super.releaseDate,
      required super.overview,
      required super.genreIds});
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        backdropPath: json['backdrop_path'],
        posterPath: json['poster_path'],
        id: json['id'],
        title: json['title'],
        voteAverage: json['vote_average'],
        releaseDate: json['release_date'],
        overview: json['overview'],
        genreIds: json['genre_ids']);
  }
  @override
  List<Object?> get props => [
        super.id,
        super.backdropPath,
        super.genreIds,
        super.overview,
        super.releaseDate,
        super.voteAverage,
        super.title,
        super.posterPath
      ];
}
