import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/features/movies/domain/entities/genres.dart';
import 'package:movies_app/features/movies/domain/repositories/movies_repository.dart';

class GetCategoryMoviesNamesUseCase {
  final MoviesRepository moviesRepository;

  GetCategoryMoviesNamesUseCase({required this.moviesRepository});

  Future<Either<Failure, List<Genres>>> call() async {
    return moviesRepository.getCategoryMoviesNames();
  }
}
