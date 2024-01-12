part of 'download_sk_bloc.dart';

@freezed
class DownloadSkEvent with _$DownloadSkEvent {
  const factory DownloadSkEvent.started() = _Started;
  const factory DownloadSkEvent.downloadSk(DownloadSkRequestModel downloadSK, String nmMatkul) = _DownloadSk;
}