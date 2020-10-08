import 'package:flutter/material.dart';
import 'package:genius_demo/core/error/exceptions.dart';
import 'package:genius_demo/core/hive/hive_boxes.dart';
import 'package:genius_demo/core/hive/hive_setup.dart';
import 'package:genius_demo/features/movies/domain/entities/movies_response.dart';

abstract class MoviesLocalDataSource {
  Future<MoviesResponse> getMovies({@required String endpoint});
  Future<void> saveMovies(
      {MoviesResponse moviesResponse, @required String endpoint});
}

class MoviesLocalDataSourceImpl implements MoviesLocalDataSource {
  @override
  Future<MoviesResponse> getMovies({String endpoint}) async {
    final moviesBox = await openBox(MOVIES_BOX);
    if (moviesBox.isNotEmpty) {
      final movies = await moviesBox.get(endpoint);
      return MoviesResponse(results: movies.cast<Results>());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> saveMovies(
      {MoviesResponse moviesResponse, String endpoint}) async {
    final moviesBox = await openBox(MOVIES_BOX);
    await moviesBox.put(endpoint, moviesResponse.results);
  }
}
