import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';
import 'package:movies_app/features/movies/domain/repositories/movies_repository.dart';

class SearchByMovieNameUseCase {
  final MoviesRepository moviesRepository;

  SearchByMovieNameUseCase({required this.moviesRepository});
  Future<Either<Failure, List<Movie>>> call(String movieName) async {
    return moviesRepository.searchByMovieName(movieName);
  }
}
