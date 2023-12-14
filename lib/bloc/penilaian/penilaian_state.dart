part of 'penilaian_bloc.dart';

@freezed
class PenilaianState with _$PenilaianState {
  const factory PenilaianState.initial() = _Initial;
  const factory PenilaianState.loading() = _Loading;
  const factory PenilaianState.loaded(PenilaianResponseModel data) = _Loaded;
  const factory PenilaianState.error(String message) = _Error;
}
