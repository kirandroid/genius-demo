import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:genius_demo/core/error/failures.dart';
import 'package:genius_demo/features/movies/domain/entities/movies_response.dart';

abstract class MoviesRepository {
  Future<Either<Failure, MoviesResponse>> getRemoteMovies(
      {@required String endpoint});
  Future<Either<Failure, MoviesResponse>> getLocalMovies(
      {@required String endpoint});
}
