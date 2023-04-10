// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Path _$$_PathFromJson(Map<String, dynamic> json) => _$_Path(
      id: json['id'] as int?,
      route: json['route'] as String?,
      type: json['type'] == null
          ? null
          : Type.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PathToJson(_$_Path instance) => <String, dynamic>{
      'id': instance.id,
      'route': instance.route,
      'type': instance.type,
    };
