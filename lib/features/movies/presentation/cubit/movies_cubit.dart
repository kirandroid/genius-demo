import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:genius_demo/features/movies/domain/entities/movies_response.dart';
import 'package:genius_demo/features/movies/domain/usecases/get_movies.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final GetMovies getMovies;
  MoviesCubit({@required this.getMovies}) : super(MoviesInitial());

  Future<void> getPopularMovies() async {
    emit(MoviesLoading());
    final failureOrNews = await getMovies(endpoint: 'popular');
    failureOrNews.fold(
      (failure) => emit(
        MoviesError(errorMessage: "Some Error"),
      ),
      (movies) => emit(
        MoviesLoaded(moviesResponse: movies),
      ),
    );
  }
}
