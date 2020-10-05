// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_video_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieVideoResponse _$MovieVideoResponseFromJson(Map<String, dynamic> json) {
  return MovieVideoResponse(
    id: json['id'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Results.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MovieVideoResponseToJson(MovieVideoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.results,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) {
  return Results(
    id: json['id'] as String,
    iso6391: json['iso6391'] as String,
    iso31661: json['iso31661'] as String,
    key: json['key'] as String,
    name: json['name'] as String,
    site: json['site'] as String,
    size: json['size'] as int,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'id': instance.id,
      'iso6391': instance.iso6391,
      'iso31661': instance.iso31661,
      'key': instance.key,
      'name': instance.name,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type,
    };
