// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoviesResponseAdapter extends TypeAdapter<MoviesResponse> {
  @override
  final int typeId = 5;

  @override
  MoviesResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoviesResponse(
      page: fields[0] as int,
      totalResults: fields[1] as int,
      totalPages: fields[2] as int,
      results: (fields[3] as List)?.cast<Results>(),
    );
  }

  @override
  void write(BinaryWriter writer, MoviesResponse obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.page)
      ..writeByte(1)
      ..write(obj.totalResults)
      ..writeByte(2)
      ..write(obj.totalPages)
      ..writeByte(3)
      ..write(obj.results);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoviesResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ResultsAdapter extends TypeAdapter<Results> {
  @override
  final int typeId = 6;

  @override
  Results read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Results(
      popularity: fields[0] as double,
      adult: fields[5] as bool,
      title: fields[10] as String,
      backdrop_path: fields[6] as String,
      genre_ids: (fields[9] as List)?.cast<int>(),
      id: fields[4] as int,
      original_language: fields[7] as String,
      original_title: fields[8] as String,
      overview: fields[12] as String,
      poster_path: fields[3] as String,
      release_date: fields[13] as String,
      video: fields[2] as bool,
      vote_average: fields[11] as double,
      vote_count: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Results obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.popularity)
      ..writeByte(1)
      ..write(obj.vote_count)
      ..writeByte(2)
      ..write(obj.video)
      ..writeByte(3)
      ..write(obj.poster_path)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.adult)
      ..writeByte(6)
      ..write(obj.backdrop_path)
      ..writeByte(7)
      ..write(obj.original_language)
      ..writeByte(8)
      ..write(obj.original_title)
      ..writeByte(9)
      ..write(obj.genre_ids)
      ..writeByte(10)
      ..write(obj.title)
      ..writeByte(11)
      ..write(obj.vote_average)
      ..writeByte(12)
      ..write(obj.overview)
      ..writeByte(13)
      ..write(obj.release_date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesResponse _$MoviesResponseFromJson(Map<String, dynamic> json) {
  return MoviesResponse(
    page: json['page'] as int,
    totalResults: json['totalResults'] as int,
    totalPages: json['totalPages'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Results.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MoviesResponseToJson(MoviesResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'totalResults': instance.totalResults,
      'totalPages': instance.totalPages,
      'results': instance.results,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) {
  return Results(
    popularity: (json['popularity'] as num)?.toDouble(),
    adult: json['adult'] as bool,
    title: json['title'] as String,
    backdrop_path: json['backdrop_path'] as String,
    genre_ids: (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
    id: json['id'] as int,
    original_language: json['original_language'] as String,
    original_title: json['original_title'] as String,
    overview: json['overview'] as String,
    poster_path: json['poster_path'] as String,
    release_date: json['release_date'] as String,
    video: json['video'] as bool,
    vote_average: (json['vote_average'] as num)?.toDouble(),
    vote_count: json['vote_count'] as int,
  );
}

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'popularity': instance.popularity,
      'vote_count': instance.vote_count,
      'video': instance.video,
      'poster_path': instance.poster_path,
      'id': instance.id,
      'adult': instance.adult,
      'backdrop_path': instance.backdrop_path,
      'original_language': instance.original_language,
      'original_title': instance.original_title,
      'genre_ids': instance.genre_ids,
      'title': instance.title,
      'vote_average': instance.vote_average,
      'overview': instance.overview,
      'release_date': instance.release_date,
    };
