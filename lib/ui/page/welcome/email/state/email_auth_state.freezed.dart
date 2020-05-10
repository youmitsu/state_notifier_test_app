// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'email_auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$EmailAuthStateTearOff {
  const _$EmailAuthStateTearOff();

  _EmailAuthState call({String email = '', String password = ''}) {
    return _EmailAuthState(
      email: email,
      password: password,
    );
  }
}

// ignore: unused_element
const $EmailAuthState = _$EmailAuthStateTearOff();

mixin _$EmailAuthState {
  String get email;
  String get password;

  $EmailAuthStateCopyWith<EmailAuthState> get copyWith;
}

abstract class $EmailAuthStateCopyWith<$Res> {
  factory $EmailAuthStateCopyWith(
          EmailAuthState value, $Res Function(EmailAuthState) then) =
      _$EmailAuthStateCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

class _$EmailAuthStateCopyWithImpl<$Res>
    implements $EmailAuthStateCopyWith<$Res> {
  _$EmailAuthStateCopyWithImpl(this._value, this._then);

  final EmailAuthState _value;
  // ignore: unused_field
  final $Res Function(EmailAuthState) _then;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

abstract class _$EmailAuthStateCopyWith<$Res>
    implements $EmailAuthStateCopyWith<$Res> {
  factory _$EmailAuthStateCopyWith(
          _EmailAuthState value, $Res Function(_EmailAuthState) then) =
      __$EmailAuthStateCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password});
}

class __$EmailAuthStateCopyWithImpl<$Res>
    extends _$EmailAuthStateCopyWithImpl<$Res>
    implements _$EmailAuthStateCopyWith<$Res> {
  __$EmailAuthStateCopyWithImpl(
      _EmailAuthState _value, $Res Function(_EmailAuthState) _then)
      : super(_value, (v) => _then(v as _EmailAuthState));

  @override
  _EmailAuthState get _value => super._value as _EmailAuthState;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
  }) {
    return _then(_EmailAuthState(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

class _$_EmailAuthState
    with DiagnosticableTreeMixin
    implements _EmailAuthState {
  const _$_EmailAuthState({this.email = '', this.password = ''})
      : assert(email != null),
        assert(password != null);

  @JsonKey(defaultValue: '')
  @override
  final String email;
  @JsonKey(defaultValue: '')
  @override
  final String password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EmailAuthState(email: $email, password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EmailAuthState'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EmailAuthState &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @override
  _$EmailAuthStateCopyWith<_EmailAuthState> get copyWith =>
      __$EmailAuthStateCopyWithImpl<_EmailAuthState>(this, _$identity);
}

abstract class _EmailAuthState implements EmailAuthState {
  const factory _EmailAuthState({String email, String password}) =
      _$_EmailAuthState;

  @override
  String get email;
  @override
  String get password;
  @override
  _$EmailAuthStateCopyWith<_EmailAuthState> get copyWith;
}
