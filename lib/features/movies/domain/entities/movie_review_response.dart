import 'package:json_annotation/json_annotation.dart';
part 'movie_review_response.g.dart';

@JsonSerializable()
class MovieReviewResponse {
  int id;
  int page;
  List<Results> results;
  int total_pages;
  int total_results;

  MovieReviewResponse(
      {this.id, this.page, this.results, this.total_pages, this.total_results});
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
