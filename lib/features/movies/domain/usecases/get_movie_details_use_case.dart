import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';
import 'package:movies_app/features/movies/domain/repositories/movies_repository.dart';

class GetMovieDetailsUseCase {
  final MoviesRepository moviesRepository;

  GetMovieDetailsUseCase({required this.moviesRepository});
  Future<Either<Failure, Movie>> call(int movieId) async {
    return moviesRepository.getMovieDetails(movieId);
  }
}
