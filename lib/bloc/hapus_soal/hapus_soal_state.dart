part of 'hapus_soal_bloc.dart';

@freezed
class HapusSoalState with _$HapusSoalState {
  const factory HapusSoalState.initial() = _Initial;
  const factory HapusSoalState.loading() = _Loading;
  const factory HapusSoalState.loaded(HapusResponseModel data) = _Loaded;
  const factory HapusSoalState.error(String message) = _Error;
}
