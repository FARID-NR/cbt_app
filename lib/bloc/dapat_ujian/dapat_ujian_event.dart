part of 'dapat_ujian_bloc.dart';

@freezed
class DapatUjianEvent with _$DapatUjianEvent {
  const factory DapatUjianEvent.started() = _Started;
  const factory DapatUjianEvent.dapatUjian({required int matkulId, required int mhsId}) = _DapatUjian;
}