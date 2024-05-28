// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemAdapter extends TypeAdapter<PreviousItem> {
  @override
  final int typeId = 3;

  @override
  PreviousItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PreviousItem(
      mealName: fields[0] as String,
      mealImagePath: fields[1] as String,
      nutritionFacts: (fields[2] as List).cast<String>(),
      dateTime: fields[3] as DateTime,
      location: fields[4] as String?,
      uuid: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PreviousItem obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.mealName)
      ..writeByte(1)
      ..write(obj.mealImagePath)
      ..writeByte(2)
      ..write(obj.nutritionFacts)
      ..writeByte(3)
      ..write(obj.dateTime)
      ..writeByte(4)
      ..write(obj.location)
      ..writeByte(5)
      ..write(obj.uuid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
