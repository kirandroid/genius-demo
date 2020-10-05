import 'package:json_annotation/json_annotation.dart';
part 'cast_crew_response.g.dart';

@JsonSerializable()
class CastCrewResponse {
  int id;
  List<Cast> cast;
  List<Crew> crew;

  CastCrewResponse({this.id, this.cast, this.crew});

  static const fromJson = _$CastCrewResponseFromJson;

  Map<String, dynamic> toJson() => _$CastCrewResponseToJson(this);
}

@JsonSerializable()
class Cast {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Cast(
      {this.castId,
      this.character,
      this.creditId,
      this.gender,
      this.id,
      this.name,
      this.order,
      this.profilePath});

  static const fromJson = _$CastFromJson;

  Map<String, dynamic> toJson() => _$CastToJson(this);
}

@JsonSerializable()
class Crew {
  String creditId;
  String department;
  int gender;
  int id;
  String job;
  String name;
  String profilePath;

  Crew(
      {this.creditId,
      this.department,
      this.gender,
      this.id,
      this.job,
      this.name,
      this.profilePath});

  static const fromJson = _$CrewFromJson;

  Map<String, dynamic> toJson() => _$CrewToJson(this);
}
