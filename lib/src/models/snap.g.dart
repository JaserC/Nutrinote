// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snap.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SnapAdapter extends TypeAdapter<Snap> {
  @override
  final int typeId = 1;

  @override
  Snap read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Snap(
      name: fields[0] as String,
      nutrition: fields[1] as String,
      imgURI: fields[2] as String,
      latitude: fields[3] as double,
      longitude: fields[4] as double,
      uuid: fields[5] as String,
      createdAt: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Snap obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.nutrition)
      ..writeByte(2)
      ..write(obj.imgURI)
      ..writeByte(3)
      ..write(obj.latitude)
      ..writeByte(4)
      ..write(obj.longitude)
      ..writeByte(5)
      ..write(obj.uuid)
      ..writeByte(6)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SnapAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
