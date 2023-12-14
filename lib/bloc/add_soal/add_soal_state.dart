part of 'add_soal_bloc.dart';

@freezed
class AddSoalState with _$AddSoalState {
  const factory AddSoalState.initial() = _Initial;
  const factory AddSoalState.loading() = _Loading;
  const factory AddSoalState.loaded(AddSoalResponseModel data) = _Loaded;
  const factory AddSoalState.error(String message) = _Error;
}
