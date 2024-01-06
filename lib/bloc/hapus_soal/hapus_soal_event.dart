part of 'hapus_soal_bloc.dart';

@freezed
class HapusSoalEvent with _$HapusSoalEvent {
  const factory HapusSoalEvent.started() = _Started;
  const factory HapusSoalEvent.hapus({required int userId}) = _Hapus;
}