// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dafttar_soal_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DaftarSoalEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<Soal> data) daftaSoal,
    required TResult Function() nextSoal,
    required TResult Function(int soalId, String jawaban) setAnswer,
    required TResult Function() backSoal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(List<Soal> data)? daftaSoal,
    TResult? Function()? nextSoal,
    TResult? Function(int soalId, String jawaban)? setAnswer,
    TResult? Function()? backSoal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Soal> data)? daftaSoal,
    TResult Function()? nextSoal,
    TResult Function(int soalId, String jawaban)? setAnswer,
    TResult Function()? backSoal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_DaftarSoal value) daftaSoal,
    required TResult Function(_NextSoal value) nextSoal,
    required TResult Function(_SetAnswer value) setAnswer,
    required TResult Function(_BackSoal value) backSoal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_DaftarSoal value)? daftaSoal,
    TResult? Function(_NextSoal value)? nextSoal,
    TResult? Function(_SetAnswer value)? setAnswer,
    TResult? Function(_BackSoal value)? backSoal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DaftarSoal value)? daftaSoal,
    TResult Function(_NextSoal value)? nextSoal,
    TResult Function(_SetAnswer value)? setAnswer,
    TResult Function(_BackSoal value)? backSoal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DaftarSoalEventCopyWith<$Res> {
  factory $DaftarSoalEventCopyWith(
          DaftarSoalEvent value, $Res Function(DaftarSoalEvent) then) =
      _$DaftarSoalEventCopyWithImpl<$Res, DaftarSoalEvent>;
}

/// @nodoc
class _$DaftarSoalEventCopyWithImpl<$Res, $Val extends DaftarSoalEvent>
    implements $DaftarSoalEventCopyWith<$Res> {
  _$DaftarSoalEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$DaftarSoalEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'DaftarSoalEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<Soal> data) daftaSoal,
    required TResult Function() nextSoal,
    required TResult Function(int soalId, String jawaban) setAnswer,
    required TResult Function() backSoal,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(List<Soal> data)? daftaSoal,
    TResult? Function()? nextSoal,
    TResult? Function(int soalId, String jawaban)? setAnswer,
    TResult? Function()? backSoal,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Soal> data)? daftaSoal,
    TResult Function()? nextSoal,
    TResult Function(int soalId, String jawaban)? setAnswer,
    TResult Function()? backSoal,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_DaftarSoal value) daftaSoal,
    required TResult Function(_NextSoal value) nextSoal,
    required TResult Function(_SetAnswer value) setAnswer,
    required TResult Function(_BackSoal value) backSoal,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_DaftarSoal value)? daftaSoal,
    TResult? Function(_NextSoal value)? nextSoal,
    TResult? Function(_SetAnswer value)? setAnswer,
    TResult? Function(_BackSoal value)? backSoal,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DaftarSoal value)? daftaSoal,
    TResult Function(_NextSoal value)? nextSoal,
    TResult Function(_SetAnswer value)? setAnswer,
    TResult Function(_BackSoal value)? backSoal,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements DaftarSoalEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$DaftarSoalImplCopyWith<$Res> {
  factory _$$DaftarSoalImplCopyWith(
          _$DaftarSoalImpl value, $Res Function(_$DaftarSoalImpl) then) =
      __$$DaftarSoalImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Soal> data});
}

/// @nodoc
class __$$DaftarSoalImplCopyWithImpl<$Res>
    extends _$DaftarSoalEventCopyWithImpl<$Res, _$DaftarSoalImpl>
    implements _$$DaftarSoalImplCopyWith<$Res> {
  __$$DaftarSoalImplCopyWithImpl(
      _$DaftarSoalImpl _value, $Res Function(_$DaftarSoalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$DaftarSoalImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Soal>,
    ));
  }
}

/// @nodoc

class _$DaftarSoalImpl implements _DaftarSoal {
  const _$DaftarSoalImpl(final List<Soal> data) : _data = data;

  final List<Soal> _data;
  @override
  List<Soal> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'DaftarSoalEvent.daftaSoal(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DaftarSoalImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DaftarSoalImplCopyWith<_$DaftarSoalImpl> get copyWith =>
      __$$DaftarSoalImplCopyWithImpl<_$DaftarSoalImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<Soal> data) daftaSoal,
    required TResult Function() nextSoal,
    required TResult Function(int soalId, String jawaban) setAnswer,
    required TResult Function() backSoal,
  }) {
    return daftaSoal(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(List<Soal> data)? daftaSoal,
    TResult? Function()? nextSoal,
    TResult? Function(int soalId, String jawaban)? setAnswer,
    TResult? Function()? backSoal,
  }) {
    return daftaSoal?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Soal> data)? daftaSoal,
    TResult Function()? nextSoal,
    TResult Function(int soalId, String jawaban)? setAnswer,
    TResult Function()? backSoal,
    required TResult orElse(),
  }) {
    if (daftaSoal != null) {
      return daftaSoal(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_DaftarSoal value) daftaSoal,
    required TResult Function(_NextSoal value) nextSoal,
    required TResult Function(_SetAnswer value) setAnswer,
    required TResult Function(_BackSoal value) backSoal,
  }) {
    return daftaSoal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_DaftarSoal value)? daftaSoal,
    TResult? Function(_NextSoal value)? nextSoal,
    TResult? Function(_SetAnswer value)? setAnswer,
    TResult? Function(_BackSoal value)? backSoal,
  }) {
    return daftaSoal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DaftarSoal value)? daftaSoal,
    TResult Function(_NextSoal value)? nextSoal,
    TResult Function(_SetAnswer value)? setAnswer,
    TResult Function(_BackSoal value)? backSoal,
    required TResult orElse(),
  }) {
    if (daftaSoal != null) {
      return daftaSoal(this);
    }
    return orElse();
  }
}

abstract class _DaftarSoal implements DaftarSoalEvent {
  const factory _DaftarSoal(final List<Soal> data) = _$DaftarSoalImpl;

  List<Soal> get data;
  @JsonKey(ignore: true)
  _$$DaftarSoalImplCopyWith<_$DaftarSoalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NextSoalImplCopyWith<$Res> {
  factory _$$NextSoalImplCopyWith(
          _$NextSoalImpl value, $Res Function(_$NextSoalImpl) then) =
      __$$NextSoalImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NextSoalImplCopyWithImpl<$Res>
    extends _$DaftarSoalEventCopyWithImpl<$Res, _$NextSoalImpl>
    implements _$$NextSoalImplCopyWith<$Res> {
  __$$NextSoalImplCopyWithImpl(
      _$NextSoalImpl _value, $Res Function(_$NextSoalImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NextSoalImpl implements _NextSoal {
  const _$NextSoalImpl();

  @override
  String toString() {
    return 'DaftarSoalEvent.nextSoal()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NextSoalImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<Soal> data) daftaSoal,
    required TResult Function() nextSoal,
    required TResult Function(int soalId, String jawaban) setAnswer,
    required TResult Function() backSoal,
  }) {
    return nextSoal();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(List<Soal> data)? daftaSoal,
    TResult? Function()? nextSoal,
    TResult? Function(int soalId, String jawaban)? setAnswer,
    TResult? Function()? backSoal,
  }) {
    return nextSoal?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Soal> data)? daftaSoal,
    TResult Function()? nextSoal,
    TResult Function(int soalId, String jawaban)? setAnswer,
    TResult Function()? backSoal,
    required TResult orElse(),
  }) {
    if (nextSoal != null) {
      return nextSoal();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_DaftarSoal value) daftaSoal,
    required TResult Function(_NextSoal value) nextSoal,
    required TResult Function(_SetAnswer value) setAnswer,
    required TResult Function(_BackSoal value) backSoal,
  }) {
    return nextSoal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_DaftarSoal value)? daftaSoal,
    TResult? Function(_NextSoal value)? nextSoal,
    TResult? Function(_SetAnswer value)? setAnswer,
    TResult? Function(_BackSoal value)? backSoal,
  }) {
    return nextSoal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DaftarSoal value)? daftaSoal,
    TResult Function(_NextSoal value)? nextSoal,
    TResult Function(_SetAnswer value)? setAnswer,
    TResult Function(_BackSoal value)? backSoal,
    required TResult orElse(),
  }) {
    if (nextSoal != null) {
      return nextSoal(this);
    }
    return orElse();
  }
}

abstract class _NextSoal implements DaftarSoalEvent {
  const factory _NextSoal() = _$NextSoalImpl;
}

/// @nodoc
abstract class _$$SetAnswerImplCopyWith<$Res> {
  factory _$$SetAnswerImplCopyWith(
          _$SetAnswerImpl value, $Res Function(_$SetAnswerImpl) then) =
      __$$SetAnswerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int soalId, String jawaban});
}

/// @nodoc
class __$$SetAnswerImplCopyWithImpl<$Res>
    extends _$DaftarSoalEventCopyWithImpl<$Res, _$SetAnswerImpl>
    implements _$$SetAnswerImplCopyWith<$Res> {
  __$$SetAnswerImplCopyWithImpl(
      _$SetAnswerImpl _value, $Res Function(_$SetAnswerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soalId = null,
    Object? jawaban = null,
  }) {
    return _then(_$SetAnswerImpl(
      null == soalId
          ? _value.soalId
          : soalId // ignore: cast_nullable_to_non_nullable
              as int,
      null == jawaban
          ? _value.jawaban
          : jawaban // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SetAnswerImpl implements _SetAnswer {
  const _$SetAnswerImpl(this.soalId, this.jawaban);

  @override
  final int soalId;
  @override
  final String jawaban;

  @override
  String toString() {
    return 'DaftarSoalEvent.setAnswer(soalId: $soalId, jawaban: $jawaban)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetAnswerImpl &&
            (identical(other.soalId, soalId) || other.soalId == soalId) &&
            (identical(other.jawaban, jawaban) || other.jawaban == jawaban));
  }

  @override
  int get hashCode => Object.hash(runtimeType, soalId, jawaban);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetAnswerImplCopyWith<_$SetAnswerImpl> get copyWith =>
      __$$SetAnswerImplCopyWithImpl<_$SetAnswerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<Soal> data) daftaSoal,
    required TResult Function() nextSoal,
    required TResult Function(int soalId, String jawaban) setAnswer,
    required TResult Function() backSoal,
  }) {
    return setAnswer(soalId, jawaban);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(List<Soal> data)? daftaSoal,
    TResult? Function()? nextSoal,
    TResult? Function(int soalId, String jawaban)? setAnswer,
    TResult? Function()? backSoal,
  }) {
    return setAnswer?.call(soalId, jawaban);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Soal> data)? daftaSoal,
    TResult Function()? nextSoal,
    TResult Function(int soalId, String jawaban)? setAnswer,
    TResult Function()? backSoal,
    required TResult orElse(),
  }) {
    if (setAnswer != null) {
      return setAnswer(soalId, jawaban);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_DaftarSoal value) daftaSoal,
    required TResult Function(_NextSoal value) nextSoal,
    required TResult Function(_SetAnswer value) setAnswer,
    required TResult Function(_BackSoal value) backSoal,
  }) {
    return setAnswer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_DaftarSoal value)? daftaSoal,
    TResult? Function(_NextSoal value)? nextSoal,
    TResult? Function(_SetAnswer value)? setAnswer,
    TResult? Function(_BackSoal value)? backSoal,
  }) {
    return setAnswer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DaftarSoal value)? daftaSoal,
    TResult Function(_NextSoal value)? nextSoal,
    TResult Function(_SetAnswer value)? setAnswer,
    TResult Function(_BackSoal value)? backSoal,
    required TResult orElse(),
  }) {
    if (setAnswer != null) {
      return setAnswer(this);
    }
    return orElse();
  }
}

abstract class _SetAnswer implements DaftarSoalEvent {
  const factory _SetAnswer(final int soalId, final String jawaban) =
      _$SetAnswerImpl;

  int get soalId;
  String get jawaban;
  @JsonKey(ignore: true)
  _$$SetAnswerImplCopyWith<_$SetAnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BackSoalImplCopyWith<$Res> {
  factory _$$BackSoalImplCopyWith(
          _$BackSoalImpl value, $Res Function(_$BackSoalImpl) then) =
      __$$BackSoalImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BackSoalImplCopyWithImpl<$Res>
    extends _$DaftarSoalEventCopyWithImpl<$Res, _$BackSoalImpl>
    implements _$$BackSoalImplCopyWith<$Res> {
  __$$BackSoalImplCopyWithImpl(
      _$BackSoalImpl _value, $Res Function(_$BackSoalImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BackSoalImpl implements _BackSoal {
  const _$BackSoalImpl();

  @override
  String toString() {
    return 'DaftarSoalEvent.backSoal()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BackSoalImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<Soal> data) daftaSoal,
    required TResult Function() nextSoal,
    required TResult Function(int soalId, String jawaban) setAnswer,
    required TResult Function() backSoal,
  }) {
    return backSoal();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(List<Soal> data)? daftaSoal,
    TResult? Function()? nextSoal,
    TResult? Function(int soalId, String jawaban)? setAnswer,
    TResult? Function()? backSoal,
  }) {
    return backSoal?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Soal> data)? daftaSoal,
    TResult Function()? nextSoal,
    TResult Function(int soalId, String jawaban)? setAnswer,
    TResult Function()? backSoal,
    required TResult orElse(),
  }) {
    if (backSoal != null) {
      return backSoal();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_DaftarSoal value) daftaSoal,
    required TResult Function(_NextSoal value) nextSoal,
    required TResult Function(_SetAnswer value) setAnswer,
    required TResult Function(_BackSoal value) backSoal,
  }) {
    return backSoal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_DaftarSoal value)? daftaSoal,
    TResult? Function(_NextSoal value)? nextSoal,
    TResult? Function(_SetAnswer value)? setAnswer,
    TResult? Function(_BackSoal value)? backSoal,
  }) {
    return backSoal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DaftarSoal value)? daftaSoal,
    TResult Function(_NextSoal value)? nextSoal,
    TResult Function(_SetAnswer value)? setAnswer,
    TResult Function(_BackSoal value)? backSoal,
    required TResult orElse(),
  }) {
    if (backSoal != null) {
      return backSoal(this);
    }
    return orElse();
  }
}

abstract class _BackSoal implements DaftarSoalEvent {
  const factory _BackSoal() = _$BackSoalImpl;
}

/// @nodoc
mixin _$DaftarSoalState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Soal> data, int index, bool isNext, bool isBack)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Soal> data, int index, bool isNext, bool isBack)?
        loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Soal> data, int index, bool isNext, bool isBack)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DaftarSoalStateCopyWith<$Res> {
  factory $DaftarSoalStateCopyWith(
          DaftarSoalState value, $Res Function(DaftarSoalState) then) =
      _$DaftarSoalStateCopyWithImpl<$Res, DaftarSoalState>;
}

/// @nodoc
class _$DaftarSoalStateCopyWithImpl<$Res, $Val extends DaftarSoalState>
    implements $DaftarSoalStateCopyWith<$Res> {
  _$DaftarSoalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$DaftarSoalStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'DaftarSoalState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Soal> data, int index, bool isNext, bool isBack)
        loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Soal> data, int index, bool isNext, bool isBack)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Soal> data, int index, bool isNext, bool isBack)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements DaftarSoalState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$DaftarSoalStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'DaftarSoalState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Soal> data, int index, bool isNext, bool isBack)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Soal> data, int index, bool isNext, bool isBack)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Soal> data, int index, bool isNext, bool isBack)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements DaftarSoalState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Soal> data, int index, bool isNext, bool isBack});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$DaftarSoalStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? index = null,
    Object? isNext = null,
    Object? isBack = null,
  }) {
    return _then(_$LoadedImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Soal>,
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      null == isNext
          ? _value.isNext
          : isNext // ignore: cast_nullable_to_non_nullable
              as bool,
      null == isBack
          ? _value.isBack
          : isBack // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      final List<Soal> data, this.index, this.isNext, this.isBack)
      : _data = data;

  final List<Soal> _data;
  @override
  List<Soal> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int index;
  @override
  final bool isNext;
  @override
  final bool isBack;

  @override
  String toString() {
    return 'DaftarSoalState.loaded(data: $data, index: $index, isNext: $isNext, isBack: $isBack)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.isNext, isNext) || other.isNext == isNext) &&
            (identical(other.isBack, isBack) || other.isBack == isBack));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_data), index, isNext, isBack);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Soal> data, int index, bool isNext, bool isBack)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(data, index, isNext, isBack);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Soal> data, int index, bool isNext, bool isBack)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(data, index, isNext, isBack);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Soal> data, int index, bool isNext, bool isBack)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data, index, isNext, isBack);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements DaftarSoalState {
  const factory _Loaded(final List<Soal> data, final int index,
      final bool isNext, final bool isBack) = _$LoadedImpl;

  List<Soal> get data;
  int get index;
  bool get isNext;
  bool get isBack;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$DaftarSoalStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'DaftarSoalState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Soal> data, int index, bool isNext, bool isBack)
        loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Soal> data, int index, bool isNext, bool isBack)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Soal> data, int index, bool isNext, bool isBack)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements DaftarSoalState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
