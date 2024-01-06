part of 'get_edit_jawaban_bloc.dart';

@freezed
class GetEditJawabanState with _$GetEditJawabanState {
  const factory GetEditJawabanState.initial() = _Initial;
  const factory GetEditJawabanState.loading() = _Loading;
  const factory GetEditJawabanState.loaded(EditJawabanResponseModel data) = _Loaded;
  const factory GetEditJawabanState.error(String message) = _Error;
}
