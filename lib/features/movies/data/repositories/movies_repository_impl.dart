import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/exceptions.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/core/network/network_info.dart';
import 'package:movies_app/features/movies/data/data_sources/movies_remote_data_source.dart';
import 'package:movies_app/features/movies/domain/entities/genres.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';
import 'package:movies_app/features/movies/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource moviesRemoteDataSource;
  final NetworkInfo networkInfo;
  MoviesRepositoryImpl({
    required this.moviesRemoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, List<Movie>>> getCategoryMovies(int idCategory) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await moviesRemoteDataSource.getCategoryMovies(idCategory);
        List<Movie> movies = result
            .map((movieModel) => Movie(
                backdropPath: movieModel.backdropPath,
                posterPath: movieModel.posterPath,
                id: movieModel.id,
                title: movieModel.title,
                voteAverage: movieModel.voteAverage,
                releaseDate: movieModel.releaseDate,
                overview: movieModel.overview,
                genreIds: movieModel.genreIds))
            .toList();
        return Right(movies);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Genres>>> getCategoryMoviesNames() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await moviesRemoteDataSource.getCategoryMoviesNames();
        List<Genres> genres = result
            .map(
              (genresModel) => Genres(
                id: genresModel.id,
                name: genresModel.name,
              ),
            )
            .toList();
        return Right(genres);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Movie>> getMovieDetails(int movieId) async {
    if (await networkInfo.isConnected) {
      try {
        final movieModel =
            await moviesRemoteDataSource.getMovieDetails(movieId);
        Movie movie = Movie(
            backdropPath: movieModel.backdropPath,
            posterPath: movieModel.posterPath,
            id: movieModel.id,
            title: movieModel.title,
            voteAverage: movieModel.voteAverage,
            releaseDate: movieModel.releaseDate,
            overview: movieModel.overview,
            genreIds: movieModel.genreIds);
        return Right(movie);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularReleaseMovies() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await moviesRemoteDataSource.getPopularReleaseMovies();
        List<Movie> movies = result
            .map((movieModel) => Movie(
                backdropPath: movieModel.backdropPath,
                posterPath: movieModel.posterPath,
                id: movieModel.id,
                title: movieModel.title,
                voteAverage: movieModel.voteAverage,
                releaseDate: movieModel.releaseDate,
                overview: movieModel.overview,
                genreIds: movieModel.genreIds))
            .toList();
        return Right(movies);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getRecommendedMovies() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await moviesRemoteDataSource.getRecommendedMovies();
        List<Movie> movies = result
            .map((movieModel) => Movie(
                backdropPath: movieModel.backdropPath,
                posterPath: movieModel.posterPath,
                id: movieModel.id,
                title: movieModel.title,
                voteAverage: movieModel.voteAverage,
                releaseDate: movieModel.releaseDate,
                overview: movieModel.overview,
                genreIds: movieModel.genreIds))
            .toList();
        return Right(movies);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getSimilarMovies(int movieId) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await moviesRemoteDataSource.getSimilarMovies(movieId);
        List<Movie> movies = result
            .map((movieModel) => Movie(
                backdropPath: movieModel.backdropPath,
                posterPath: movieModel.posterPath,
                id: movieModel.id,
                title: movieModel.title,
                voteAverage: movieModel.voteAverage,
                releaseDate: movieModel.releaseDate,
                overview: movieModel.overview,
                genreIds: movieModel.genreIds))
            .toList();
        return Right(movies);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> searchByMovieName(
      String movieName) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await moviesRemoteDataSource.searchByMovieName(movieName);
        List<Movie> movies = result
            .map((movieModel) => Movie(
                backdropPath: movieModel.backdropPath,
                posterPath: movieModel.posterPath,
                id: movieModel.id,
                title: movieModel.title,
                voteAverage: movieModel.voteAverage,
                releaseDate: movieModel.releaseDate,
                overview: movieModel.overview,
                genreIds: movieModel.genreIds))
            .toList();
        return Right(movies);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
