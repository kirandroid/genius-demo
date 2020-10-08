// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GenreResponseAdapter extends TypeAdapter<GenreResponse> {
  @override
  final int typeId = 7;

  @override
  GenreResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GenreResponse(
      genres: (fields[0] as List)?.cast<Genres>(),
    );
  }

  @override
  void write(BinaryWriter writer, GenreResponse obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.genres);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenreResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GenresAdapter extends TypeAdapter<Genres> {
  @override
  final int typeId = 8;

  @override
  Genres read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Genres(
      id: fields[0] as int,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Genres obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenresAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenreResponse _$GenreResponseFromJson(Map<String, dynamic> json) {
  return GenreResponse(
    genres: (json['genres'] as List)
        ?.map((e) =>
            e == null ? null : Genres.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GenreResponseToJson(GenreResponse instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };

Genres _$GenresFromJson(Map<String, dynamic> json) {
  return Genres(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$GenresToJson(Genres instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
