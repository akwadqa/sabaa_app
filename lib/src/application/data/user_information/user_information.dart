import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../infrastructure/storage/hive/hive_type_ids.dart';

part 'user_information.freezed.dart';
part 'user_information.g.dart';

/// **Hive & Freezed Integrated Model**
@freezed
@HiveType(typeId: HiveTypeIds.userInfoTypId)
abstract class UserInformation with _$UserInformation {
  /// **Factory Constructor**
  factory UserInformation({
    @HiveField(0) required String userId,
    @HiveField(1) @JsonKey(name: "full_name") required String fullName,
    @HiveField(2) @JsonKey(name: "role") required String role,
    @HiveField(3) required String? email,
    @HiveField(4) required String? warehouse,
  }) = _UserInformation;

  /// **Default Empty Object (If Needed)**
  factory UserInformation.empty() =>
      UserInformation(userId: "", fullName: "", role: "", email: "", warehouse: "");
  static UserInformation defaultValue = UserInformation(userId: "", fullName: "", role: "", email: "", warehouse: "");
  /// **Factory Constructor for JSON**
  factory UserInformation.fromJson(Map<String, dynamic> json) =>
      _$UserInformationFromJson(json);
}

class UserInformationAdapter extends TypeAdapter<UserInformation> {
  @override
  final int typeId = HiveTypeIds.userInfoTypId;

  @override
  UserInformation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return UserInformation(
      userId: fields[0] as String,
      fullName: fields[1] as String,
      role: fields[2] as String,
      email: fields[3] as String,
      warehouse: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserInformation obj) {
    writer
      ..writeByte(5) // number of fields
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.role)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.warehouse)
 
      ;
  }
}
