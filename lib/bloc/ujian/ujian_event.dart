part of 'ujian_bloc.dart';

@freezed
class UjianEvent with _$UjianEvent {
  const factory UjianEvent.started() = _Started;
  const factory UjianEvent.getUjian({required String matkulId}) = _GetUjian;
}