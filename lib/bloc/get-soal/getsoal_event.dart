part of 'getsoal_bloc.dart';

@freezed
class GetsoalEvent with _$GetsoalEvent {
  const factory GetsoalEvent.started() = _Started;
  const factory GetsoalEvent.getSoal({required int userId}) = _GetSoal;
}
