part of 'lihat_nilai_bloc.dart';

@freezed
class LihatNilaiState with _$LihatNilaiState {
  const factory LihatNilaiState.initial() = _Initial;
  const factory LihatNilaiState.loading() = _Loading;
  const factory LihatNilaiState.loaded(LihatNilaiResponseModel data) = _Loaded;
  const factory LihatNilaiState.error(String message) = _Error;
}
