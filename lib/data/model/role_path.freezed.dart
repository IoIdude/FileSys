// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_path.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RolePath _$RolePathFromJson(Map<String, dynamic> json) {
  return _RolePath.fromJson(json);
}

/// @nodoc
mixin _$RolePath {
  int? get id => throw _privateConstructorUsedError;
  Type? get type => throw _privateConstructorUsedError;
  Role? get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RolePathCopyWith<RolePath> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RolePathCopyWith<$Res> {
  factory $RolePathCopyWith(RolePath value, $Res Function(RolePath) then) =
      _$RolePathCopyWithImpl<$Res, RolePath>;
  @useResult
  $Res call({int? id, Type? type, Role? role});

  $TypeCopyWith<$Res>? get type;
  $RoleCopyWith<$Res>? get role;
}

/// @nodoc
class _$RolePathCopyWithImpl<$Res, $Val extends RolePath>
    implements $RolePathCopyWith<$Res> {
  _$RolePathCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? role = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Type?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TypeCopyWith<$Res>? get type {
    if (_value.type == null) {
      return null;
    }

    return $TypeCopyWith<$Res>(_value.type!, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RoleCopyWith<$Res>? get role {
    if (_value.role == null) {
      return null;
    }

    return $RoleCopyWith<$Res>(_value.role!, (value) {
      return _then(_value.copyWith(role: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RolePathCopyWith<$Res> implements $RolePathCopyWith<$Res> {
  factory _$$_RolePathCopyWith(
          _$_RolePath value, $Res Function(_$_RolePath) then) =
      __$$_RolePathCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, Type? type, Role? role});

  @override
  $TypeCopyWith<$Res>? get type;
  @override
  $RoleCopyWith<$Res>? get role;
}

/// @nodoc
class __$$_RolePathCopyWithImpl<$Res>
    extends _$RolePathCopyWithImpl<$Res, _$_RolePath>
    implements _$$_RolePathCopyWith<$Res> {
  __$$_RolePathCopyWithImpl(
      _$_RolePath _value, $Res Function(_$_RolePath) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? role = freezed,
  }) {
    return _then(_$_RolePath(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Type?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RolePath with DiagnosticableTreeMixin implements _RolePath {
  const _$_RolePath({this.id, this.type, this.role});

  factory _$_RolePath.fromJson(Map<String, dynamic> json) =>
      _$$_RolePathFromJson(json);

  @override
  final int? id;
  @override
  final Type? type;
  @override
  final Role? role;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RolePath(id: $id, type: $type, role: $role)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RolePath'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('role', role));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RolePath &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RolePathCopyWith<_$_RolePath> get copyWith =>
      __$$_RolePathCopyWithImpl<_$_RolePath>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RolePathToJson(
      this,
    );
  }
}

abstract class _RolePath implements RolePath {
  const factory _RolePath({final int? id, final Type? type, final Role? role}) =
      _$_RolePath;

  factory _RolePath.fromJson(Map<String, dynamic> json) = _$_RolePath.fromJson;

  @override
  int? get id;
  @override
  Type? get type;
  @override
  Role? get role;
  @override
  @JsonKey(ignore: true)
  _$$_RolePathCopyWith<_$_RolePath> get copyWith =>
      throw _privateConstructorUsedError;
}
