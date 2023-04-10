import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'type.dart';

part 'path.freezed.dart';
part 'path.g.dart';

@freezed
class Path with _$Path {
  const factory Path({int? id, String? route, Type? type}) = _Path;

  factory Path.fromJson(Map<String, dynamic> json) => _$PathFromJson(json);
}
