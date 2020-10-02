import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:genius_demo/features/news/domain/entities/news_response.dart';
import 'package:genius_demo/features/news/domain/usecases/get_latest_news.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final GetLatestNews getLatestNews;
  NewsCubit({@required this.getLatestNews}) : super(NewsInitial());

  Future<void> getLatestNewsEvent() async {
    emit(NewsLoading());
    final failureOrNews = await getLatestNews();
    failureOrNews.fold(
      (failure) => emit(
        NewsError(errorMessage: "Some Error"),
      ),
      (news) => emit(
        NewsLoaded(newsResponse: news),
      ),
    );
  }
}
