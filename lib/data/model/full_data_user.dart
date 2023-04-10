import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'role.dart';

part 'full_data_user.freezed.dart';
part 'full_data_user.g.dart';

@freezed
class FullDataUser with _$FullDataUser {
  const factory FullDataUser(
      {int? id, String? email, int? role_id, Role? role}) = _FullDataUser;

  factory FullDataUser.fromJson(Map<String, dynamic> json) =>
      _$FullDataUserFromJson(json);
}
