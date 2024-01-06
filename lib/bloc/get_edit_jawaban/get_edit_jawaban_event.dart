part of 'get_edit_jawaban_bloc.dart';

@freezed
class GetEditJawabanEvent with _$GetEditJawabanEvent {
  const factory GetEditJawabanEvent.started() = _Started;
  const factory GetEditJawabanEvent.getJawaban(int soalId) = _GetJawaban;
}