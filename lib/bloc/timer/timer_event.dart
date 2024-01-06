part of 'timer_bloc.dart';

@freezed
class TimerEvent with _$TimerEvent {
  const factory TimerEvent.started() = _Started;
  const factory TimerEvent.timer(TimerRequestModel data, int soalId) = _Timer;
  const factory TimerEvent.delete(int dataId) = _Delete;
}