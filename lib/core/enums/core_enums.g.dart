// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_enums.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeTypeAdapter extends TypeAdapter<ThemeType> {
  @override
  final int typeId = 0;

  @override
  ThemeType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ThemeType.dark;
      case 1:
        return ThemeType.light;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, ThemeType obj) {
    switch (obj) {
      case ThemeType.dark:
        writer.writeByte(0);
        break;
      case ThemeType.light:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
