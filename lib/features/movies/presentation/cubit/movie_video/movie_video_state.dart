part of 'movie_video_cubit.dart';

abstract class MovieVideoState extends Equatable {
  const MovieVideoState();

  @override
  List<Object> get props => [];
}

class MovieVideoInitial extends MovieVideoState {}

class MovieVideoLoading extends MovieVideoState {}

class MovieVideoEmpty extends MovieVideoState {}

class MovieVideoError extends MovieVideoState {
  final String errorMessage;
  MovieVideoError({@required this.errorMessage});
}

class MovieVideoLoaded extends MovieVideoState {
  final MovieVideoResponse movieVideos;
  MovieVideoLoaded({@required this.movieVideos});
}
