part of 'batal_kirim_bloc.dart';

@freezed
class BatalKirimEvent with _$BatalKirimEvent {
  const factory BatalKirimEvent.started() = _Started;
  const factory BatalKirimEvent.batalKirim({required int matkulId, required int mhsId}) = _BatalKirim;
}