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
    cast_id: json['cast_id'] as int,
    character: json['character'] as String,
    credit_id: json['credit_id'] as String,
    gender: json['gender'] as int,
    id: json['id'] as int,
    name: json['name'] as String,
    order: json['order'] as int,
    profile_path: json['profile_path'] as String,
  );
}

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
      'cast_id': instance.cast_id,
      'character': instance.character,
      'credit_id': instance.credit_id,
      'gender': instance.gender,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'profile_path': instance.profile_path,
    };

Crew _$CrewFromJson(Map<String, dynamic> json) {
  return Crew(
    credit_id: json['credit_id'] as String,
    department: json['department'] as String,
    gender: json['gender'] as int,
    id: json['id'] as int,
    job: json['job'] as String,
    name: json['name'] as String,
    profile_path: json['profile_path'] as String,
  );
}

Map<String, dynamic> _$CrewToJson(Crew instance) => <String, dynamic>{
      'credit_id': instance.credit_id,
      'department': instance.department,
      'gender': instance.gender,
      'id': instance.id,
      'job': instance.job,
      'name': instance.name,
      'profile_path': instance.profile_path,
    };
