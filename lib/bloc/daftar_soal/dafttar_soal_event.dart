part of 'dafttar_soal_bloc.dart';

@freezed
class DaftarSoalEvent with _$DaftarSoalEvent {
  const factory DaftarSoalEvent.started() = _Started;
  const factory DaftarSoalEvent.daftaSoal(List<Soal> data) = _DaftarSoal;
  const factory DaftarSoalEvent.nextSoal() = _NextSoal;
  const factory DaftarSoalEvent.setAnswer(
    int soalId,
    String jawaban
  ) = _SetAnswer;
  const factory DaftarSoalEvent.backSoal() = _BackSoal;
}