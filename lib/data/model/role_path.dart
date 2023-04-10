import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'type.dart';
import 'role.dart';

part 'role_path.freezed.dart';
part 'role_path.g.dart';

@freezed
class RolePath with _$RolePath {
  const factory RolePath({int? id, Type? type, Role? role}) = _RolePath;

  factory RolePath.fromJson(Map<String, dynamic> json) =>
      _$RolePathFromJson(json);
}
