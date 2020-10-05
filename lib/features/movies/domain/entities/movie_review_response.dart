import 'package:json_annotation/json_annotation.dart';
part 'movie_review_response.g.dart';

@JsonSerializable()
class MovieReviewResponse {
  int id;
  int page;
  List<Results> results;
  int totalPages;
  int totalResults;

  MovieReviewResponse(
      {this.id, this.page, this.results, this.totalPages, this.totalResults});
  static const fromJson = _$MovieReviewResponseFromJson;

  Map<String, dynamic> toJson() => _$MovieReviewResponseToJson(this);
}

@JsonSerializable()
class Results {
  String author;
  String content;
  String id;
  String url;

  Results({this.author, this.content, this.id, this.url});
  static const fromJson = _$ResultsFromJson;

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
