part of 'submit_answer_bloc.dart';

@freezed
class SubmitAnswerState with _$SubmitAnswerState {
  const factory SubmitAnswerState.initial() = _Initial;
  const factory SubmitAnswerState.loading() = _Loading;
  const factory SubmitAnswerState.loaded(SubmitResponseModel data) = _Loaded;
  const factory SubmitAnswerState.error(String message) = _Error;
}
