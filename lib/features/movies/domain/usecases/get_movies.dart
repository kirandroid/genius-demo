import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:genius_demo/core/error/failures.dart';
import 'package:genius_demo/core/usecases/usecase.dart';
import 'package:genius_demo/features/movies/domain/entities/movies_response.dart';
import 'package:genius_demo/features/movies/domain/repositories/movies_repository.dart';

class GetMovies implements UseCase {
  final MoviesRepository repository;

  GetMovies({this.repository});

  @override
  Future<Either<Failure, MoviesResponse>> call(
      {@required String endpoint}) async {
    return repository.getMovies(endpoint: endpoint);
  }
}
