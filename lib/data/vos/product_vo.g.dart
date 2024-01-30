// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductVOAdapter extends TypeAdapter<ProductVO> {
  @override
  final int typeId = 1;

  @override
  ProductVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductVO(
      id: fields[0] as int?,
      productName: fields[1] as String?,
      productImg: fields[2] as String?,
      quantity: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductVO obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.productName)
      ..writeByte(2)
      ..write(obj.productImg)
      ..writeByte(3)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
