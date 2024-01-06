part of 'dapat_ujian_bloc.dart';

@freezed
class DapatUjianState with _$DapatUjianState {
  const factory DapatUjianState.initial() = _Initial;
  const factory DapatUjianState.loading() = _Loading;
  const factory DapatUjianState.loaded(DapatUjianResponseModel data) = _Loaded;
  const factory DapatUjianState.error(String message) = _Error;
}
