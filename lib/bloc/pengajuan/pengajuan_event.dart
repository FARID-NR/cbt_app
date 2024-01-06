part of 'pengajuan_bloc.dart';

@freezed
class PengajuanEvent with _$PengajuanEvent {
  const factory PengajuanEvent.started() = _Started;
  const factory PengajuanEvent.pengajuan({required int userId}) = _Pengajuan;
  // const factory PengajuanEvent.dapatUjian({required int matkulId, required int mhsId}) = _DapatUjian;
  // const factory PengajuanEvent.pengajuanId({required int userIdS}) = _PengajuanId;
}
