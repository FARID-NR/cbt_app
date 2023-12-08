part of 'pengajuan_bloc.dart';

@freezed
class PengajuanState with _$PengajuanState {
  const factory PengajuanState.initial() = _Initial;
  const factory PengajuanState.loading() = _Loading;
  const factory PengajuanState.loaded(PengajuanResponseModel data) = _Loaded;
  // const factory PengajuanState.loadedId(DapatUjianResponseModel data) = _LoadedId;
  const factory PengajuanState.error(String message) = _Error;
}
