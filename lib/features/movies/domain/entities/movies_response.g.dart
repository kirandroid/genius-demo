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
      backdropPath: fields[6] as String,
      genreIds: (fields[9] as List)?.cast<int>(),
      id: fields[4] as int,
      originalLanguage: fields[7] as String,
      originalTitle: fields[8] as String,
      overview: fields[12] as String,
      posterPath: fields[3] as String,
      releaseDate: fields[13] as String,
      video: fields[2] as bool,
      voteAverage: fields[11] as double,
      voteCount: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Results obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.popularity)
      ..writeByte(1)
      ..write(obj.voteCount)
      ..writeByte(2)
      ..write(obj.video)
      ..writeByte(3)
      ..write(obj.posterPath)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.adult)
      ..writeByte(6)
      ..write(obj.backdropPath)
      ..writeByte(7)
      ..write(obj.originalLanguage)
      ..writeByte(8)
      ..write(obj.originalTitle)
      ..writeByte(9)
      ..write(obj.genreIds)
      ..writeByte(10)
      ..write(obj.title)
      ..writeByte(11)
      ..write(obj.voteAverage)
      ..writeByte(12)
      ..write(obj.overview)
      ..writeByte(13)
      ..write(obj.releaseDate);
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
    backdropPath: json['backdropPath'] as String,
    genreIds: (json['genreIds'] as List)?.map((e) => e as int)?.toList(),
    id: json['id'] as int,
    originalLanguage: json['originalLanguage'] as String,
    originalTitle: json['originalTitle'] as String,
    overview: json['overview'] as String,
    posterPath: json['posterPath'] as String,
    releaseDate: json['releaseDate'] as String,
    video: json['video'] as bool,
    voteAverage: (json['voteAverage'] as num)?.toDouble(),
    voteCount: json['voteCount'] as int,
  );
}

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'popularity': instance.popularity,
      'voteCount': instance.voteCount,
      'video': instance.video,
      'posterPath': instance.posterPath,
      'id': instance.id,
      'adult': instance.adult,
      'backdropPath': instance.backdropPath,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'genreIds': instance.genreIds,
      'title': instance.title,
      'voteAverage': instance.voteAverage,
      'overview': instance.overview,
      'releaseDate': instance.releaseDate,
    };
