// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'path.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Path _$PathFromJson(Map<String, dynamic> json) {
  return _Path.fromJson(json);
}

/// @nodoc
mixin _$Path {
  int? get id => throw _privateConstructorUsedError;
  String? get route => throw _privateConstructorUsedError;
  Type? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PathCopyWith<Path> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PathCopyWith<$Res> {
  factory $PathCopyWith(Path value, $Res Function(Path) then) =
      _$PathCopyWithImpl<$Res, Path>;
  @useResult
  $Res call({int? id, String? route, Type? type});

  $TypeCopyWith<$Res>? get type;
}

/// @nodoc
class _$PathCopyWithImpl<$Res, $Val extends Path>
    implements $PathCopyWith<$Res> {
  _$PathCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? route = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Type?,
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
}

/// @nodoc
abstract class _$$_PathCopyWith<$Res> implements $PathCopyWith<$Res> {
  factory _$$_PathCopyWith(_$_Path value, $Res Function(_$_Path) then) =
      __$$_PathCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? route, Type? type});

  @override
  $TypeCopyWith<$Res>? get type;
}

/// @nodoc
class __$$_PathCopyWithImpl<$Res> extends _$PathCopyWithImpl<$Res, _$_Path>
    implements _$$_PathCopyWith<$Res> {
  __$$_PathCopyWithImpl(_$_Path _value, $Res Function(_$_Path) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? route = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_Path(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Type?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Path with DiagnosticableTreeMixin implements _Path {
  const _$_Path({this.id, this.route, this.type});

  factory _$_Path.fromJson(Map<String, dynamic> json) => _$$_PathFromJson(json);

  @override
  final int? id;
  @override
  final String? route;
  @override
  final Type? type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Path(id: $id, route: $route, type: $type)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Path'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('route', route))
      ..add(DiagnosticsProperty('type', type));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Path &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, route, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PathCopyWith<_$_Path> get copyWith =>
      __$$_PathCopyWithImpl<_$_Path>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PathToJson(
      this,
    );
  }
}

abstract class _Path implements Path {
  const factory _Path({final int? id, final String? route, final Type? type}) =
      _$_Path;

  factory _Path.fromJson(Map<String, dynamic> json) = _$_Path.fromJson;

  @override
  int? get id;
  @override
  String? get route;
  @override
  Type? get type;
  @override
  @JsonKey(ignore: true)
  _$$_PathCopyWith<_$_Path> get copyWith => throw _privateConstructorUsedError;
}
