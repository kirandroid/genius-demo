// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_crew_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastCrewResponse _$CastCrewResponseFromJson(Map<String, dynamic> json) {
  return CastCrewResponse(
    id: json['id'] as int,
    cast: (json['cast'] as List)
        ?.map(
            (e) => e == null ? null : Cast.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    crew: (json['crew'] as List)
        ?.map(
            (e) => e == null ? null : Crew.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CastCrewResponseToJson(CastCrewResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
      'crew': instance.crew,
    };

Cast _$CastFromJson(Map<String, dynamic> json) {
  return Cast(
    castId: json['castId'] as int,
    character: json['character'] as String,
    creditId: json['creditId'] as String,
    gender: json['gender'] as int,
    id: json['id'] as int,
    name: json['name'] as String,
    order: json['order'] as int,
    profilePath: json['profilePath'] as String,
  );
}

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
      'castId': instance.castId,
      'character': instance.character,
      'creditId': instance.creditId,
      'gender': instance.gender,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'profilePath': instance.profilePath,
    };

Crew _$CrewFromJson(Map<String, dynamic> json) {
  return Crew(
    creditId: json['creditId'] as String,
    department: json['department'] as String,
    gender: json['gender'] as int,
    id: json['id'] as int,
    job: json['job'] as String,
    name: json['name'] as String,
    profilePath: json['profilePath'] as String,
  );
}

Map<String, dynamic> _$CrewToJson(Crew instance) => <String, dynamic>{
      'creditId': instance.creditId,
      'department': instance.department,
      'gender': instance.gender,
      'id': instance.id,
      'job': instance.job,
      'name': instance.name,
      'profilePath': instance.profilePath,
    };
