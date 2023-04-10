// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'full_data_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FullDataUser _$FullDataUserFromJson(Map<String, dynamic> json) {
  return _FullDataUser.fromJson(json);
}

/// @nodoc
mixin _$FullDataUser {
  int? get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  int? get role_id => throw _privateConstructorUsedError;
  Role? get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FullDataUserCopyWith<FullDataUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FullDataUserCopyWith<$Res> {
  factory $FullDataUserCopyWith(
          FullDataUser value, $Res Function(FullDataUser) then) =
      _$FullDataUserCopyWithImpl<$Res, FullDataUser>;
  @useResult
  $Res call({int? id, String? email, int? role_id, Role? role});

  $RoleCopyWith<$Res>? get role;
}

/// @nodoc
class _$FullDataUserCopyWithImpl<$Res, $Val extends FullDataUser>
    implements $FullDataUserCopyWith<$Res> {
  _$FullDataUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? role_id = freezed,
    Object? role = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      role_id: freezed == role_id
          ? _value.role_id
          : role_id // ignore: cast_nullable_to_non_nullable
              as int?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role?,
    ) as $Val);
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
abstract class _$$_FullDataUserCopyWith<$Res>
    implements $FullDataUserCopyWith<$Res> {
  factory _$$_FullDataUserCopyWith(
          _$_FullDataUser value, $Res Function(_$_FullDataUser) then) =
      __$$_FullDataUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? email, int? role_id, Role? role});

  @override
  $RoleCopyWith<$Res>? get role;
}

/// @nodoc
class __$$_FullDataUserCopyWithImpl<$Res>
    extends _$FullDataUserCopyWithImpl<$Res, _$_FullDataUser>
    implements _$$_FullDataUserCopyWith<$Res> {
  __$$_FullDataUserCopyWithImpl(
      _$_FullDataUser _value, $Res Function(_$_FullDataUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? role_id = freezed,
    Object? role = freezed,
  }) {
    return _then(_$_FullDataUser(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      role_id: freezed == role_id
          ? _value.role_id
          : role_id // ignore: cast_nullable_to_non_nullable
              as int?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FullDataUser with DiagnosticableTreeMixin implements _FullDataUser {
  const _$_FullDataUser({this.id, this.email, this.role_id, this.role});

  factory _$_FullDataUser.fromJson(Map<String, dynamic> json) =>
      _$$_FullDataUserFromJson(json);

  @override
  final int? id;
  @override
  final String? email;
  @override
  final int? role_id;
  @override
  final Role? role;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FullDataUser(id: $id, email: $email, role_id: $role_id, role: $role)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FullDataUser'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('role_id', role_id))
      ..add(DiagnosticsProperty('role', role));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FullDataUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role_id, role_id) || other.role_id == role_id) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, role_id, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FullDataUserCopyWith<_$_FullDataUser> get copyWith =>
      __$$_FullDataUserCopyWithImpl<_$_FullDataUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FullDataUserToJson(
      this,
    );
  }
}

abstract class _FullDataUser implements FullDataUser {
  const factory _FullDataUser(
      {final int? id,
      final String? email,
      final int? role_id,
      final Role? role}) = _$_FullDataUser;

  factory _FullDataUser.fromJson(Map<String, dynamic> json) =
      _$_FullDataUser.fromJson;

  @override
  int? get id;
  @override
  String? get email;
  @override
  int? get role_id;
  @override
  Role? get role;
  @override
  @JsonKey(ignore: true)
  _$$_FullDataUserCopyWith<_$_FullDataUser> get copyWith =>
      throw _privateConstructorUsedError;
}
