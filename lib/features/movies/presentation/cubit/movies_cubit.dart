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
    final popularMoviesFailureOrMovie = await getMovies(endpoint: 'popular');
    final nowPlayingMoviesFailureOrMovie =
        await getMovies(endpoint: 'now_playing');
    final topRatedMoviesFailureOrMovie = await getMovies(endpoint: 'top_rated');
    final upcomingMoviesFailureOrMovie = await getMovies(endpoint: 'upcoming');

    MoviesResponse popularMovie;
    MoviesResponse nowPlayingMovie;
    MoviesResponse topRatedMovie;
    MoviesResponse upcomingMovie;
    popularMoviesFailureOrMovie.fold(
        (failure) => emit(
              MoviesError(errorMessage: "Some Error"),
            ),
        (movies) => popularMovie = movies);
    nowPlayingMoviesFailureOrMovie.fold(
        (failure) => emit(
              MoviesError(errorMessage: "Some Error"),
            ),
        (movies) => nowPlayingMovie = movies);

    topRatedMoviesFailureOrMovie.fold(
        (failure) => emit(
              MoviesError(errorMessage: "Some Error"),
            ),
        (movies) => topRatedMovie = movies);

    upcomingMoviesFailureOrMovie.fold(
        (failure) => emit(
              MoviesError(errorMessage: "Some Error"),
            ),
        (movies) => upcomingMovie = movies);

    emit(
      MoviesLoaded(
        popularMovies: popularMovie,
        nowPlayingMovies: nowPlayingMovie,
        topRatedMovies: topRatedMovie,
        upcomingMovies: upcomingMovie,
      ),
    );
  }
}
