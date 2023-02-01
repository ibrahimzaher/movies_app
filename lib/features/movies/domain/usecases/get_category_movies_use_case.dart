import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';
import 'package:movies_app/features/movies/domain/repositories/movies_repository.dart';

class GetCategoryMoviesUseCase {
  final MoviesRepository moviesRepository;

  GetCategoryMoviesUseCase({required this.moviesRepository});

  Future<Either<Failure, List<Movie>>> call(int idCategory) async {
    return moviesRepository.getCategoryMovies(idCategory);
  }
}
