// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Files.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Files _$FilesFromJson(Map<String, dynamic> json) {
  return _Files.fromJson(json);
}

/// @nodoc
mixin _$Files {
  String? get current_folder => throw _privateConstructorUsedError;
  List<String>? get files => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FilesCopyWith<Files> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilesCopyWith<$Res> {
  factory $FilesCopyWith(Files value, $Res Function(Files) then) =
      _$FilesCopyWithImpl<$Res, Files>;
  @useResult
  $Res call({String? current_folder, List<String>? files});
}

/// @nodoc
class _$FilesCopyWithImpl<$Res, $Val extends Files>
    implements $FilesCopyWith<$Res> {
  _$FilesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current_folder = freezed,
    Object? files = freezed,
  }) {
    return _then(_value.copyWith(
      current_folder: freezed == current_folder
          ? _value.current_folder
          : current_folder // ignore: cast_nullable_to_non_nullable
              as String?,
      files: freezed == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilesCopyWith<$Res> implements $FilesCopyWith<$Res> {
  factory _$$_FilesCopyWith(_$_Files value, $Res Function(_$_Files) then) =
      __$$_FilesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? current_folder, List<String>? files});
}

/// @nodoc
class __$$_FilesCopyWithImpl<$Res> extends _$FilesCopyWithImpl<$Res, _$_Files>
    implements _$$_FilesCopyWith<$Res> {
  __$$_FilesCopyWithImpl(_$_Files _value, $Res Function(_$_Files) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current_folder = freezed,
    Object? files = freezed,
  }) {
    return _then(_$_Files(
      current_folder: freezed == current_folder
          ? _value.current_folder
          : current_folder // ignore: cast_nullable_to_non_nullable
              as String?,
      files: freezed == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Files with DiagnosticableTreeMixin implements _Files {
  const _$_Files({this.current_folder, final List<String>? files})
      : _files = files;

  factory _$_Files.fromJson(Map<String, dynamic> json) =>
      _$$_FilesFromJson(json);

  @override
  final String? current_folder;
  final List<String>? _files;
  @override
  List<String>? get files {
    final value = _files;
    if (value == null) return null;
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Files(current_folder: $current_folder, files: $files)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Files'))
      ..add(DiagnosticsProperty('current_folder', current_folder))
      ..add(DiagnosticsProperty('files', files));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Files &&
            (identical(other.current_folder, current_folder) ||
                other.current_folder == current_folder) &&
            const DeepCollectionEquality().equals(other._files, _files));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, current_folder, const DeepCollectionEquality().hash(_files));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilesCopyWith<_$_Files> get copyWith =>
      __$$_FilesCopyWithImpl<_$_Files>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FilesToJson(
      this,
    );
  }
}

abstract class _Files implements Files {
  const factory _Files(
      {final String? current_folder, final List<String>? files}) = _$_Files;

  factory _Files.fromJson(Map<String, dynamic> json) = _$_Files.fromJson;

  @override
  String? get current_folder;
  @override
  List<String>? get files;
  @override
  @JsonKey(ignore: true)
  _$$_FilesCopyWith<_$_Files> get copyWith =>
      throw _privateConstructorUsedError;
}
