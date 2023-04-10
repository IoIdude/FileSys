import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'role.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({int? id, String? email, int? role_id}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
