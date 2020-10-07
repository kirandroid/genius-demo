// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GitHubResponseAdapter extends TypeAdapter<GitHubResponse> {
  @override
  final int typeId = 9;

  @override
  GitHubResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GitHubResponse(
      id: fields[0] as int,
      name: fields[1] as String,
      fullName: fields[2] as String,
      private: fields[3] as bool,
      owner: fields[4] as Owner,
      htmlUrl: fields[5] as String,
      description: fields[6] as String,
      fork: fields[7] as bool,
      createdAt: fields[8] as String,
      updatedAt: fields[9] as String,
      pushedAt: fields[10] as String,
      homepage: fields[11] as String,
      stargazersCount: fields[12] as int,
      language: fields[13] as String,
      forksCount: fields[14] as int,
      forks: fields[15] as int,
      defaultBranch: fields[16] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GitHubResponse obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.fullName)
      ..writeByte(3)
      ..write(obj.private)
      ..writeByte(4)
      ..write(obj.owner)
      ..writeByte(5)
      ..write(obj.htmlUrl)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.fork)
      ..writeByte(8)
      ..write(obj.createdAt)
      ..writeByte(9)
      ..write(obj.updatedAt)
      ..writeByte(10)
      ..write(obj.pushedAt)
      ..writeByte(11)
      ..write(obj.homepage)
      ..writeByte(12)
      ..write(obj.stargazersCount)
      ..writeByte(13)
      ..write(obj.language)
      ..writeByte(14)
      ..write(obj.forksCount)
      ..writeByte(15)
      ..write(obj.forks)
      ..writeByte(16)
      ..write(obj.defaultBranch);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GitHubResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OwnerAdapter extends TypeAdapter<Owner> {
  @override
  final int typeId = 10;

  @override
  Owner read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Owner(
      login: fields[0] as String,
      id: fields[1] as int,
    )
      ..avatarUrl = fields[2] as String
      ..htmlUrl = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, Owner obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.login)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.avatarUrl)
      ..writeByte(3)
      ..write(obj.htmlUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OwnerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GitHubResponse _$GitHubResponseFromJson(Map<String, dynamic> json) {
  return GitHubResponse(
    id: json['id'] as int,
    name: json['name'] as String,
    fullName: json['fullName'] as String,
    private: json['private'] as bool,
    owner: json['owner'] == null
        ? null
        : Owner.fromJson(json['owner'] as Map<String, dynamic>),
    htmlUrl: json['htmlUrl'] as String,
    description: json['description'] as String,
    fork: json['fork'] as bool,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
    pushedAt: json['pushedAt'] as String,
    homepage: json['homepage'] as String,
    stargazersCount: json['stargazersCount'] as int,
    language: json['language'] as String,
    forksCount: json['forksCount'] as int,
    forks: json['forks'] as int,
    defaultBranch: json['defaultBranch'] as String,
  );
}

Map<String, dynamic> _$GitHubResponseToJson(GitHubResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fullName': instance.fullName,
      'private': instance.private,
      'owner': instance.owner,
      'htmlUrl': instance.htmlUrl,
      'description': instance.description,
      'fork': instance.fork,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'pushedAt': instance.pushedAt,
      'homepage': instance.homepage,
      'stargazersCount': instance.stargazersCount,
      'language': instance.language,
      'forksCount': instance.forksCount,
      'forks': instance.forks,
      'defaultBranch': instance.defaultBranch,
    };

Owner _$OwnerFromJson(Map<String, dynamic> json) {
  return Owner(
    login: json['login'] as String,
    id: json['id'] as int,
  )
    ..avatarUrl = json['avatarUrl'] as String
    ..htmlUrl = json['htmlUrl'] as String;
}

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'avatarUrl': instance.avatarUrl,
      'htmlUrl': instance.htmlUrl,
    };
