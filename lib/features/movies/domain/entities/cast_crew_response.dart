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
  int cast_id;
  String character;
  String credit_id;
  int gender;
  int id;
  String name;
  int order;
  String profile_path;

  Cast(
      {this.cast_id,
      this.character,
      this.credit_id,
      this.gender,
      this.id,
      this.name,
      this.order,
      this.profile_path});

  static const fromJson = _$CastFromJson;

  Map<String, dynamic> toJson() => _$CastToJson(this);
}

@JsonSerializable()
class Crew {
  String credit_id;
  String department;
  int gender;
  int id;
  String job;
  String name;
  String profile_path;

  Crew(
      {this.credit_id,
      this.department,
      this.gender,
      this.id,
      this.job,
      this.name,
      this.profile_path});

  static const fromJson = _$CrewFromJson;

  Map<String, dynamic> toJson() => _$CrewToJson(this);
}
