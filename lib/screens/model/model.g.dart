// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DatabaseModelAdapter extends TypeAdapter<DatabaseModel> {
  @override
  final int typeId = 1;

  @override
  DatabaseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DatabaseModel(
      density: fields[1] as String,
      valume: fields[0] as String,
      weight: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DatabaseModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.valume)
      ..writeByte(1)
      ..write(obj.density)
      ..writeByte(2)
      ..write(obj.weight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatabaseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
