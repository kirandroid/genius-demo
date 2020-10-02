import 'package:dartz/dartz.dart';
import 'package:genius_demo/features/news/domain/entities/news_response.dart';
import 'package:genius_demo/features/news/domain/repositories/news_repository.dart';
import 'package:genius_demo/features/news/domain/usecases/get_latest_news.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGetLatestNewsRepository extends Mock implements NewsRepository {}

void main() {
  GetLatestNews usecase;
  MockGetLatestNewsRepository mockLatestNewsRepository;

  setUp(() {
    mockLatestNewsRepository = MockGetLatestNewsRepository();
    usecase = GetLatestNews(repository: mockLatestNewsRepository);
  });

  final testNews = NewsResponse(articles: [
    Articles(
        source: Source(id: "1", name: "News"),
        author: "Kiran",
        title: "News",
        description: "News",
        url: "URL",
        urlToImage: "IMAGE",
        publishedAt: "2019",
        content: "Content")
  ]);
  test(
    "Should get the latest News from the repository",
    () async {
      //arrange
      when(mockLatestNewsRepository.getLatestNews()).thenAnswer(
        (_) async => Right(testNews),
      );

      //act
      final result = await usecase();

      //assert
      expect(result, Right(testNews));
      verify(mockLatestNewsRepository.getLatestNews());
      verifyNoMoreInteractions(mockLatestNewsRepository);
    },
  );
}
