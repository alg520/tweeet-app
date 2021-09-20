// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweeet.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TweeetAdapter extends TypeAdapter<Tweeet> {
  @override
  final int typeId = 1;

  @override
  Tweeet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tweeet(
      id: fields[0] as String,
      user: fields[1] as User?,
      tweeet: fields[2] as String?,
      image: fields[3] as String?,
      createdAt: fields[4] as String?,
      likes: fields[5] as int?,
      comments: fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Tweeet obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.user)
      ..writeByte(2)
      ..write(obj.tweeet)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.likes)
      ..writeByte(6)
      ..write(obj.comments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TweeetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
