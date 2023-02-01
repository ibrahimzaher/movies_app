import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';
import 'package:movies_app/features/movies/domain/repositories/movies_repository.dart';

class GetSimilarMoviesUseCase {
  final MoviesRepository moviesRepository;

  GetSimilarMoviesUseCase({required this.moviesRepository});
  Future<Either<Failure, List<Movie>>> call(int movieId) async {
    return moviesRepository.getSimilarMovies(movieId);
  }
}
