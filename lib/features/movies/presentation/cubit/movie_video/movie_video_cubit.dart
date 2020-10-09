import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:genius_demo/features/movies/domain/entities/movie_video_response.dart';
import 'package:genius_demo/features/movies/domain/usecases/get_movies.dart';

part 'movie_video_state.dart';

class MovieVideoCubit extends Cubit<MovieVideoState> {
  final GetMovies getMovies;
  MovieVideoCubit({@required this.getMovies}) : super(MovieVideoInitial());

  Future<void> getMovieVideos({@required String movie_id}) async {
    emit(MovieVideoLoading());

    final failureOrVideo = await getMovies.getMovieVideo(movie_id: movie_id);

    failureOrVideo.fold(
      (failure) => emit(MovieVideoError(errorMessage: 'Something went wrong!')),
      (video) => emit(MovieVideoLoaded(movieVideos: video)),
    );
  }
}
