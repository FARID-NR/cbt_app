part of 'lihat_nilai_bloc.dart';

@freezed
class LihatNilaiEvent with _$LihatNilaiEvent {
  const factory LihatNilaiEvent.started() = _Started;
  const factory LihatNilaiEvent.lihat({required int idMatkul, required int idMhs}) = _Lihat;
}
