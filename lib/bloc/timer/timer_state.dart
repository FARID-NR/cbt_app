part of 'timer_bloc.dart';

@freezed
class TimerState with _$TimerState {
  const factory TimerState.initial() = _Initial;
  const factory TimerState.loading() = _Loading;
  const factory TimerState.loaded(TimerResponseModel data) = _Loaded;
  const factory TimerState.error(String message) = _Error;
}
