part of 'penilaian_bloc.dart';

@freezed
class PenilaianEvent with _$PenilaianEvent {
  const factory PenilaianEvent.started() = _Started;
  const factory PenilaianEvent.penilaian(String userId) = _Penilaian;
}
