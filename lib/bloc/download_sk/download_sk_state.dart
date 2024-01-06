part of 'download_sk_bloc.dart';

@freezed
class DownloadSkState with _$DownloadSkState {
  const factory DownloadSkState.initial() = _Initial;
  const factory DownloadSkState.loading() = _Loading;
  const factory DownloadSkState.loaded(Uint8List pdfData) = _Loaded;
  const factory DownloadSkState.error(String message) = _Error;
}
