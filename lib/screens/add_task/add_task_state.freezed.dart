// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'add_task_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AddTaskStateTearOff {
  const _$AddTaskStateTearOff();

  _AddTaskState call({String body = ''}) {
    return _AddTaskState(
      body: body,
    );
  }
}

/// @nodoc
const $AddTaskState = _$AddTaskStateTearOff();

/// @nodoc
mixin _$AddTaskState {
  String get body => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddTaskStateCopyWith<AddTaskState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTaskStateCopyWith<$Res> {
  factory $AddTaskStateCopyWith(
          AddTaskState value, $Res Function(AddTaskState) then) =
      _$AddTaskStateCopyWithImpl<$Res>;
  $Res call({String body});
}

/// @nodoc
class _$AddTaskStateCopyWithImpl<$Res> implements $AddTaskStateCopyWith<$Res> {
  _$AddTaskStateCopyWithImpl(this._value, this._then);

  final AddTaskState _value;
  // ignore: unused_field
  final $Res Function(AddTaskState) _then;

  @override
  $Res call({
    Object? body = freezed,
  }) {
    return _then(_value.copyWith(
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AddTaskStateCopyWith<$Res>
    implements $AddTaskStateCopyWith<$Res> {
  factory _$AddTaskStateCopyWith(
          _AddTaskState value, $Res Function(_AddTaskState) then) =
      __$AddTaskStateCopyWithImpl<$Res>;
  @override
  $Res call({String body});
}

/// @nodoc
class __$AddTaskStateCopyWithImpl<$Res> extends _$AddTaskStateCopyWithImpl<$Res>
    implements _$AddTaskStateCopyWith<$Res> {
  __$AddTaskStateCopyWithImpl(
      _AddTaskState _value, $Res Function(_AddTaskState) _then)
      : super(_value, (v) => _then(v as _AddTaskState));

  @override
  _AddTaskState get _value => super._value as _AddTaskState;

  @override
  $Res call({
    Object? body = freezed,
  }) {
    return _then(_AddTaskState(
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddTaskState with DiagnosticableTreeMixin implements _AddTaskState {
  const _$_AddTaskState({this.body = ''});

  @JsonKey(defaultValue: '')
  @override
  final String body;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddTaskState(body: $body)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddTaskState'))
      ..add(DiagnosticsProperty('body', body));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddTaskState &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(body);

  @JsonKey(ignore: true)
  @override
  _$AddTaskStateCopyWith<_AddTaskState> get copyWith =>
      __$AddTaskStateCopyWithImpl<_AddTaskState>(this, _$identity);
}

abstract class _AddTaskState implements AddTaskState {
  const factory _AddTaskState({String body}) = _$_AddTaskState;

  @override
  String get body => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AddTaskStateCopyWith<_AddTaskState> get copyWith =>
      throw _privateConstructorUsedError;
}
