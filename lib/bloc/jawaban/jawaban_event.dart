part of 'jawaban_bloc.dart';

@freezed
class JawabanEvent with _$JawabanEvent {
  const factory JawabanEvent.started() = _Started;
  const factory JawabanEvent.jawaban(JawabanRequestModel data, int soalId) = _Jawaban;
}