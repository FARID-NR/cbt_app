part of 'edit_soal_bloc.dart';

@freezed
class EditSoalState with _$EditSoalState {
  const factory EditSoalState.initial() = _Initial;
  const factory EditSoalState.loading() = _Loading;
  const factory EditSoalState.loaded(EditResponseModel data) = _Loaded;
  const factory EditSoalState.error(String message) = _Error;
}
