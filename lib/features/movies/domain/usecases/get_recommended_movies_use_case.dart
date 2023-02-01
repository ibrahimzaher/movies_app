import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';
import 'package:movies_app/features/movies/domain/repositories/movies_repository.dart';

class GetRecommendedMoviesUseCase {
  final MoviesRepository moviesRepository;

  GetRecommendedMoviesUseCase({required this.moviesRepository});

  Future<Either<Failure, List<Movie>>> call() async {
    return moviesRepository.getRecommendedMovies();
  }
}
