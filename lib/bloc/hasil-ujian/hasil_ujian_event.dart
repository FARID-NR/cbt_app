part of 'hasil_ujian_bloc.dart';

@freezed
class HasilUjianEvent with _$HasilUjianEvent {
  const factory HasilUjianEvent.started() = _Started;
  const factory HasilUjianEvent.hasil(String matkulId) = _Hasil;
}