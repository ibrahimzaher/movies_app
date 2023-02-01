import 'package:equatable/equatable.dart';

// we Need Two Model for movie and deatails
class Movie extends Equatable {
  final String? backdropPath;
  final String? posterPath;
  final int id;
  final String title;
  final num voteAverage;
  final String releaseDate;
  final String overview;
  final List genreIds;
  const Movie(
      {required this.backdropPath,
      required this.posterPath,
      required this.id,
      required this.title,
      required this.voteAverage,
      required this.releaseDate,
      required this.overview,
      required this.genreIds});

  @override
  List<Object?> get props => [
        id,
        backdropPath,
        posterPath,
        title,
        voteAverage,
        releaseDate,
        overview,
        genreIds
      ];
}
