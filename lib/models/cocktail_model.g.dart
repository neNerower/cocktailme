// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CocktailModelAdapter extends TypeAdapter<CocktailModel> {
  @override
  final int typeId = 0;

  @override
  CocktailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CocktailModel(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String?,
    )..ingredients = (fields[6] as List).cast<String>();
  }

  @override
  void write(BinaryWriter writer, CocktailModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.alcoholic)
      ..writeByte(3)
      ..write(obj.glassType)
      ..writeByte(4)
      ..write(obj.instructions)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.ingredients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CocktailModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
