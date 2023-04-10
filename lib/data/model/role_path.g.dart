// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_path.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RolePath _$$_RolePathFromJson(Map<String, dynamic> json) => _$_RolePath(
      id: json['id'] as int?,
      type: json['type'] == null
          ? null
          : Type.fromJson(json['type'] as Map<String, dynamic>),
      role: json['role'] == null
          ? null
          : Role.fromJson(json['role'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RolePathToJson(_$_RolePath instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'role': instance.role,
    };
