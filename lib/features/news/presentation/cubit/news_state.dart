part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsEmpty extends NewsState {}

class NewsError extends NewsState {
  final String errorMessage;
  NewsError({@required this.errorMessage});
}

class NewsLoaded extends NewsState {
  final NewsResponse newsResponse;
  NewsLoaded({@required this.newsResponse});
}
