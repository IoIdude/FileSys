// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Files.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Files _$$_FilesFromJson(Map<String, dynamic> json) => _$_Files(
      current_folder: json['current_folder'] as String?,
      files:
          (json['files'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_FilesToJson(_$_Files instance) => <String, dynamic>{
      'current_folder': instance.current_folder,
      'files': instance.files,
    };
