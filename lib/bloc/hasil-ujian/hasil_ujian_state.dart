part of 'hasil_ujian_bloc.dart';

@freezed
class HasilUjianState with _$HasilUjianState {
  const factory HasilUjianState.initial() = _Initial;
  const factory HasilUjianState.loading() = _Loading;
  const factory HasilUjianState.loaded(HasilUjianResponseModel data) = _Loaded;
  const factory HasilUjianState.error(String message) = _Error;
}
