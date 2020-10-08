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
    MoviesResponse popularMovie = MoviesResponse();
    MoviesResponse nowPlayingMovie = MoviesResponse();
    MoviesResponse topRatedMovie = MoviesResponse();
    MoviesResponse upcomingMovie = MoviesResponse();
    final localFailureOrPopular =
        await getMovies.getLocalMovies(endpoint: 'popular');
    final localFailureOrNowPlaying =
        await getMovies.getLocalMovies(endpoint: 'now_playing');
    final localFailureOrTopRated =
        await getMovies.getLocalMovies(endpoint: 'top_rated');
    final localFailureOrUpcoming =
        await getMovies.getLocalMovies(endpoint: 'upcoming');

    localFailureOrPopular.fold(
        (failure) => emit(
              MoviesError(errorMessage: "Some Error"),
            ),
        (movies) => popularMovie = movies);
    localFailureOrNowPlaying.fold(
        (failure) => emit(
              MoviesError(errorMessage: "Some Error"),
            ),
        (movies) => nowPlayingMovie = movies);

    localFailureOrTopRated.fold(
        (failure) => emit(
              MoviesError(errorMessage: "Some Error"),
            ),
        (movies) => topRatedMovie = movies);

    localFailureOrUpcoming.fold(
        (failure) => emit(
              MoviesError(errorMessage: "Some Error"),
            ),
        (movies) => upcomingMovie = movies);

    if (popularMovie.results != null &&
        nowPlayingMovie.results != null &&
        topRatedMovie.results != null &&
        upcomingMovie.results != null) {
      emit(
        MoviesLoaded(
          popularMovies: popularMovie,
          nowPlayingMovies: nowPlayingMovie,
          topRatedMovies: topRatedMovie,
          upcomingMovies: upcomingMovie,
        ),
      );
    }

    final remoteFailureOrPopular =
        await getMovies.getRemoteMovies(endpoint: 'popular');
    final remoteFailureOrNowPlaying =
        await getMovies.getRemoteMovies(endpoint: 'now_playing');
    final remoteFailureOrTopRated =
        await getMovies.getRemoteMovies(endpoint: 'top_rated');
    final remoteFailureOrUpcoming =
        await getMovies.getRemoteMovies(endpoint: 'upcoming');

    remoteFailureOrPopular.fold(
        (failure) => emit(
              MoviesError(errorMessage: "Some Error"),
            ),
        (movies) => popularMovie = movies);
    remoteFailureOrNowPlaying.fold(
        (failure) => emit(
              MoviesError(errorMessage: "Some Error"),
            ),
        (movies) => nowPlayingMovie = movies);

    remoteFailureOrTopRated.fold(
        (failure) => emit(
              MoviesError(errorMessage: "Some Error"),
            ),
        (movies) => topRatedMovie = movies);

    remoteFailureOrUpcoming.fold(
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
