part of 'edit_soal_bloc.dart';

@freezed
class EditSoalEvent with _$EditSoalEvent {
  const factory EditSoalEvent.started() = _Started;
  const factory EditSoalEvent.edit(EditRequestModel data, int soalId) = _Edit;
}