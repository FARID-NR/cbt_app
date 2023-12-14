part of 'add_soal_bloc.dart';

@freezed
class AddSoalEvent with _$AddSoalEvent {
  const factory AddSoalEvent.started() = _Started;
  const factory AddSoalEvent.addSoal(AddSoalRequestModel data) = _AddSoal;
}