part of 'jawaban_bloc.dart';

@freezed
class JawabanState with _$JawabanState {
  const factory JawabanState.initial() = _Initial;
  const factory JawabanState.loading() = _Loading;
  const factory JawabanState.loaded(JawabanResponseModel data) = _Loaded;
  const factory JawabanState.error(String message) = _Error;
}
