// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieReviewResponse _$MovieReviewResponseFromJson(Map<String, dynamic> json) {
  return MovieReviewResponse(
    id: json['id'] as int,
    page: json['page'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Results.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    total_pages: json['total_pages'] as int,
    total_results: json['total_results'] as int,
  );
}

Map<String, dynamic> _$MovieReviewResponseToJson(
        MovieReviewResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.total_pages,
      'total_results': instance.total_results,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) {
  return Results(
    author: json['author'] as String,
    content: json['content'] as String,
    id: json['id'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'author': instance.author,
      'content': instance.content,
      'id': instance.id,
      'url': instance.url,
    };
