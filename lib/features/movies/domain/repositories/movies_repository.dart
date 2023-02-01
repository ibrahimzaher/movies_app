import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/features/movies/domain/entities/genres.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<Either<Failure, List<Movie>>> getPopularReleaseMovies();
  Future<Either<Failure, List<Movie>>> getRecommendedMovies();
  Future<Either<Failure, Movie>> getMovieDetails(int movieId);
  Future<Either<Failure, List<Movie>>> getSimilarMovies(int movieId);
  Future<Either<Failure, List<Movie>>> searchByMovieName(String movieName);
  Future<Either<Failure, List<Genres>>> getCategoryMoviesNames();
  Future<Either<Failure, List<Movie>>> getCategoryMovies(int idCategory);
}
