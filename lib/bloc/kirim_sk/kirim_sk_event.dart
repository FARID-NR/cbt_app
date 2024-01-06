part of 'kirim_sk_bloc.dart';

@freezed
class KirimSkEvent with _$KirimSkEvent {
  const factory KirimSkEvent.started() = _Started;
  const factory KirimSkEvent.kirimSK(KirimSkRequestModel kirimSk, String nmMatkul, BuildContext context) = _KirimSk;
}