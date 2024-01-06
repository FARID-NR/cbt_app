part of 'download_sk_bloc.dart';

@freezed
class DownloadSkEvent with _$DownloadSkEvent {
  const factory DownloadSkEvent.started() = _Started;
  const factory DownloadSkEvent.download_sk(DownloadSkRequestModel downloadSK, String nmMatkul) = _DownloadSk;
}