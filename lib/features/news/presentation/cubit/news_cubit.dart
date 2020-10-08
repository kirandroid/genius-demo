import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:genius_demo/features/news/domain/entities/news_response.dart';
import 'package:genius_demo/features/news/domain/usecases/get_news.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final GetNews getNews;
  NewsCubit({@required this.getNews}) : super(NewsInitial());

  Future<void> getNewsEvent({String category}) async {
    emit(NewsLoading());
    final failureOrNewsLocal =
        await getNews.getNewsFromLocal(category: category);
    failureOrNewsLocal.fold(
      (failure) => emit(
        NewsError(errorMessage: "Some Error"),
      ),
      (news) => emit(
        NewsLoaded(newsResponse: news),
      ),
    );

    final failureOrNewsRemote =
        await getNews.getNewsFromRemote(category: category);
    failureOrNewsRemote.fold(
      (failure) => emit(
        NewsError(errorMessage: "Some Error"),
      ),
      (news) => emit(
        NewsLoaded(newsResponse: news),
      ),
    );
  }
}
