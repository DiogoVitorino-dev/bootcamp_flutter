// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dadosModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DadosModelAdapter extends TypeAdapter<DadosModel> {
  @override
  final int typeId = 0;

  @override
  DadosModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DadosModel()
      .._nome = fields[0] as String
      .._dataNasc = fields[1] as DateTime?
      .._nivelProg = fields[2] as String
      .._linPreferencia = (fields[3] as List).cast<String>()
      .._tempoExp = fields[4] as int
      .._salario = fields[5] as double;
  }

  @override
  void write(BinaryWriter writer, DadosModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj._nome)
      ..writeByte(1)
      ..write(obj._dataNasc)
      ..writeByte(2)
      ..write(obj._nivelProg)
      ..writeByte(3)
      ..write(obj._linPreferencia)
      ..writeByte(4)
      ..write(obj._tempoExp)
      ..writeByte(5)
      ..write(obj._salario);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DadosModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
