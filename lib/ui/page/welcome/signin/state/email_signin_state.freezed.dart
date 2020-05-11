// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'email_signin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$EmailSignInStateTearOff {
  const _$EmailSignInStateTearOff();

  _EmailSignInState call(
      {String email = '', String password = '', bool isLoading = false}) {
    return _EmailSignInState(
      email: email,
      password: password,
      isLoading: isLoading,
    );
  }
}

// ignore: unused_element
const $EmailSignInState = _$EmailSignInStateTearOff();

mixin _$EmailSignInState {
  String get email;
  String get password;
  bool get isLoading;

  $EmailSignInStateCopyWith<EmailSignInState> get copyWith;
}

abstract class $EmailSignInStateCopyWith<$Res> {
  factory $EmailSignInStateCopyWith(
          EmailSignInState value, $Res Function(EmailSignInState) then) =
      _$EmailSignInStateCopyWithImpl<$Res>;
  $Res call({String email, String password, bool isLoading});
}

class _$EmailSignInStateCopyWithImpl<$Res>
    implements $EmailSignInStateCopyWith<$Res> {
  _$EmailSignInStateCopyWithImpl(this._value, this._then);

  final EmailSignInState _value;
  // ignore: unused_field
  final $Res Function(EmailSignInState) _then;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
    Object isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

abstract class _$EmailSignInStateCopyWith<$Res>
    implements $EmailSignInStateCopyWith<$Res> {
  factory _$EmailSignInStateCopyWith(
          _EmailSignInState value, $Res Function(_EmailSignInState) then) =
      __$EmailSignInStateCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password, bool isLoading});
}

class __$EmailSignInStateCopyWithImpl<$Res>
    extends _$EmailSignInStateCopyWithImpl<$Res>
    implements _$EmailSignInStateCopyWith<$Res> {
  __$EmailSignInStateCopyWithImpl(
      _EmailSignInState _value, $Res Function(_EmailSignInState) _then)
      : super(_value, (v) => _then(v as _EmailSignInState));

  @override
  _EmailSignInState get _value => super._value as _EmailSignInState;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
    Object isLoading = freezed,
  }) {
    return _then(_EmailSignInState(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

class _$_EmailSignInState
    with DiagnosticableTreeMixin
    implements _EmailSignInState {
  const _$_EmailSignInState(
      {this.email = '', this.password = '', this.isLoading = false})
      : assert(email != null),
        assert(password != null),
        assert(isLoading != null);

  @JsonKey(defaultValue: '')
  @override
  final String email;
  @JsonKey(defaultValue: '')
  @override
  final String password;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EmailSignInState(email: $email, password: $password, isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EmailSignInState'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EmailSignInState &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(isLoading);

  @override
  _$EmailSignInStateCopyWith<_EmailSignInState> get copyWith =>
      __$EmailSignInStateCopyWithImpl<_EmailSignInState>(this, _$identity);
}

abstract class _EmailSignInState implements EmailSignInState {
  const factory _EmailSignInState(
      {String email, String password, bool isLoading}) = _$_EmailSignInState;

  @override
  String get email;
  @override
  String get password;
  @override
  bool get isLoading;
  @override
  _$EmailSignInStateCopyWith<_EmailSignInState> get copyWith;
}
