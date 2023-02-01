// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/core/errors/exceptions.dart';
import 'package:movies_app/features/movies/data/models/genres_model.dart';
import 'package:movies_app/features/movies/data/models/movie_model.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MovieModel>> getPopularReleaseMovies();
  Future<List<MovieModel>> getRecommendedMovies();
  Future<MovieModel> getMovieDetails(int movieId);
  Future<List<MovieModel>> getSimilarMovies(int movieId);
  Future<List<MovieModel>> searchByMovieName(String movieName);
  Future<List<GenresModel>> getCategoryMoviesNames();
  Future<List<MovieModel>> getCategoryMovies(int idCategory);
}

const String BASE_URL = 'https://api.themoviedb.org/3';
const KEY = 'api_key';
const KEY_VALUE = 'eba4cf273520c1dc06b990cc431e1da2';
const QUERY = 'query';
const WITH_GENRES = 'with_genres';

class MoviesRemoteDataSourceWithHttp implements MoviesRemoteDataSource {
  final http.Client client;
  MoviesRemoteDataSourceWithHttp({required this.client});

  @override
  Future<List<MovieModel>> getCategoryMovies(int idCategory) async {
    final response = await client.get(
      Uri.parse(
          '$BASE_URL/discover/movie?$KEY=$KEY_VALUE&sort_by=popularity.desc&$WITH_GENRES=${idCategory.toString()}'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      List listData = data['results'] as List;
      List<MovieModel> movies = listData
          .map<MovieModel>((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<GenresModel>> getCategoryMoviesNames() async {
    final response = await client
        .get(Uri.parse('$BASE_URL/genre/movie/list?$KEY=$KEY_VALUE'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      List listData = data['genres'] as List;
      List<GenresModel> genres =
          listData.map((genre) => GenresModel.fromJson(genre)).toList();
      return genres;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieModel> getMovieDetails(int movieId) async {
    final response = await client.get(
      Uri.parse('$BASE_URL/movie/${movieId.toString()}?$KEY=$KEY_VALUE'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      final listGenres = data['genres'] as List;
      List<GenresModel> genres =
          listGenres.map((genres) => GenresModel.fromJson(genres)).toList();
      MovieModel movieModel = MovieModel(
          backdropPath: data['backdrop_path'],
          posterPath: data['poster_path'],
          id: data['id'],
          title: data['title'],
          voteAverage: data['vote_average'],
          releaseDate: data['release_date'],
          overview: data['overview'],
          genreIds: genres);
      return movieModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getPopularReleaseMovies() async {
    final response = await client.get(
      Uri.parse('$BASE_URL/movie/popular?$KEY=$KEY_VALUE'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      List listData = data['results'] as List;
      List<MovieModel> movies = listData
          .map<MovieModel>((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getRecommendedMovies() async {
    final response = await client.get(
      Uri.parse('$BASE_URL/movie/top_rated?$KEY=$KEY_VALUE'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      List listData = data['results'] as List;
      List<MovieModel> movies = listData
          .map<MovieModel>((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getSimilarMovies(int movieId) async {
    final response = await client.get(
      Uri.parse(
          '$BASE_URL/movie/${movieId.toString()}/similar?$KEY=$KEY_VALUE'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      List listData = data['results'] as List;
      List<MovieModel> movies = listData
          .map<MovieModel>((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> searchByMovieName(String movieName) async {
    final response = await client.get(
      Uri.parse('$BASE_URL/search/movie?$KEY=$KEY_VALUE&$QUERY=$movieName'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      List listData = data['results'] as List;
      List<MovieModel> movies = listData
          .map<MovieModel>((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException();
    }
  }
}
