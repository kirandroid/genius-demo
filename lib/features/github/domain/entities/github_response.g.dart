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
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as bool,
      fields[4] as Owner,
      fields[5] as String,
      fields[6] as String,
      fields[7] as bool,
      fields[8] as String,
      fields[9] as String,
      fields[10] as String,
      fields[11] as String,
      fields[12] as int,
      fields[13] as String,
      fields[14] as int,
      fields[15] as int,
      fields[16] as String,
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
      fields[0] as String,
      fields[1] as int,
      fields[2] as String,
      fields[3] as String,
    );
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
