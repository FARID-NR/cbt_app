part of 'batal_kirim_bloc.dart';

@freezed
class BatalKirimState with _$BatalKirimState {
  const factory BatalKirimState.initial() = _Initial;
  const factory BatalKirimState.loading() = _Loading;
  const factory BatalKirimState.loaded(BatalKirimModel data) = _Loaded;
  const factory BatalKirimState.error(String message) = _Error;
}
