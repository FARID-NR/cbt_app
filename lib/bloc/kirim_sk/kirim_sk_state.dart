part of 'kirim_sk_bloc.dart';

@freezed
class KirimSkState with _$KirimSkState {
  const factory KirimSkState.initial() = _Initial;
  const factory KirimSkState.loading() = _Loading;
  const factory KirimSkState.loaded(Uint8List pdfData) = _Loaded;
  const factory KirimSkState.error(String message) = _Error;
}
