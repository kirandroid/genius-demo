import 'package:genius_demo/core/hive/hive_type_id.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'genre_response.g.dart';

@HiveType(typeId: GENRES_TID)
@JsonSerializable()
class GenreResponse {
  @HiveField(0)
  final List<Genres> genres;

  const GenreResponse({this.genres});

  static const fromJson = _$GenreResponseFromJson;

  Map<String, dynamic> toJson() => _$GenreResponseToJson(this);
}

@HiveType(typeId: GENRES_ITEM_TID)
@JsonSerializable()
class Genres {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;

  Genres({this.id, this.name});

  static const fromJson = _$GenresFromJson;

  Map<String, dynamic> toJson() => _$GenresToJson(this);
}
