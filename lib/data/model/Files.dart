import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'role.dart';

part 'Files.freezed.dart';
part 'Files.g.dart';

@freezed
class Files with _$Files {
  const factory Files({String? current_folder, List<String>? files}) = _Files;

  factory Files.fromJson(Map<String, dynamic> json) => _$FilesFromJson(json);
}
