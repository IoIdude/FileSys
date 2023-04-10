// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_data_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FullDataUser _$$_FullDataUserFromJson(Map<String, dynamic> json) =>
    _$_FullDataUser(
      id: json['id'] as int?,
      email: json['email'] as String?,
      role_id: json['role_id'] as int?,
      role: json['role'] == null
          ? null
          : Role.fromJson(json['role'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FullDataUserToJson(_$_FullDataUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'role_id': instance.role_id,
      'role': instance.role,
    };
