// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'email_signup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$EmailSignUpStateTearOff {
  const _$EmailSignUpStateTearOff();

  _EmailSignUpState call({String email = '', String password = ''}) {
    return _EmailSignUpState(
      email: email,
      password: password,
    );
  }
}

// ignore: unused_element
const $EmailSignUpState = _$EmailSignUpStateTearOff();

mixin _$EmailSignUpState {
  String get email;
  String get password;

  $EmailSignUpStateCopyWith<EmailSignUpState> get copyWith;
}

abstract class $EmailSignUpStateCopyWith<$Res> {
  factory $EmailSignUpStateCopyWith(
          EmailSignUpState value, $Res Function(EmailSignUpState) then) =
      _$EmailSignUpStateCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

class _$EmailSignUpStateCopyWithImpl<$Res>
    implements $EmailSignUpStateCopyWith<$Res> {
  _$EmailSignUpStateCopyWithImpl(this._value, this._then);

  final EmailSignUpState _value;
  // ignore: unused_field
  final $Res Function(EmailSignUpState) _then;

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

abstract class _$EmailSignUpStateCopyWith<$Res>
    implements $EmailSignUpStateCopyWith<$Res> {
  factory _$EmailSignUpStateCopyWith(
          _EmailSignUpState value, $Res Function(_EmailSignUpState) then) =
      __$EmailSignUpStateCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password});
}

class __$EmailSignUpStateCopyWithImpl<$Res>
    extends _$EmailSignUpStateCopyWithImpl<$Res>
    implements _$EmailSignUpStateCopyWith<$Res> {
  __$EmailSignUpStateCopyWithImpl(
      _EmailSignUpState _value, $Res Function(_EmailSignUpState) _then)
      : super(_value, (v) => _then(v as _EmailSignUpState));

  @override
  _EmailSignUpState get _value => super._value as _EmailSignUpState;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
  }) {
    return _then(_EmailSignUpState(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

class _$_EmailSignUpState
    with DiagnosticableTreeMixin
    implements _EmailSignUpState {
  const _$_EmailSignUpState({this.email = '', this.password = ''})
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
    return 'EmailSignUpState(email: $email, password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EmailSignUpState'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EmailSignUpState &&
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
  _$EmailSignUpStateCopyWith<_EmailSignUpState> get copyWith =>
      __$EmailSignUpStateCopyWithImpl<_EmailSignUpState>(this, _$identity);
}

abstract class _EmailSignUpState implements EmailSignUpState {
  const factory _EmailSignUpState({String email, String password}) =
      _$_EmailSignUpState;

  @override
  String get email;
  @override
  String get password;
  @override
  _$EmailSignUpStateCopyWith<_EmailSignUpState> get copyWith;
}
