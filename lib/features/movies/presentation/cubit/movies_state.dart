part of 'movies_cubit.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesEmpty extends MoviesState {}

class MoviesError extends MoviesState {
  final String errorMessage;
  MoviesError({@required this.errorMessage});
}

class MoviesLoaded extends MoviesState {
  final MoviesResponse popularMovies;
  final MoviesResponse nowPlayingMovies;
  final MoviesResponse topRatedMovies;
  final MoviesResponse upcomingMovies;
  MoviesLoaded({
    @required this.popularMovies,
    @required this.nowPlayingMovies,
    @required this.topRatedMovies,
    @required this.upcomingMovies,
  });
}
