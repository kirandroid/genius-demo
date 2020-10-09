import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:genius_demo/core/error/failures.dart';
import 'package:genius_demo/core/usecases/usecase.dart';
import 'package:genius_demo/features/movies/domain/entities/movie_video_response.dart';
import 'package:genius_demo/features/movies/domain/entities/movies_response.dart';
import 'package:genius_demo/features/movies/domain/repositories/movies_repository.dart';

class GetMovies {
  final MoviesRepository repository;

  GetMovies({this.repository});

  Future<Either<Failure, MoviesResponse>> getLocalMovies(
      {@required String endpoint}) async {
    return repository.getLocalMovies(endpoint: endpoint);
  }

  Future<Either<Failure, MoviesResponse>> getRemoteMovies(
      {@required String endpoint}) async {
    return repository.getRemoteMovies(endpoint: endpoint);
  }

  Future<Either<Failure, MovieVideoResponse>> getMovieVideo(
      {@required String movie_id}) async {
    return repository.getMovieVideo(movie_id: movie_id);
  }
}
