part of 'submit_answer_bloc.dart';

@freezed
class SubmitAnswerEvent with _$SubmitAnswerEvent {
  const factory SubmitAnswerEvent.started() = _Started;
  const factory SubmitAnswerEvent.submit(SubmitRequestModel requestModel, String matkulId, String soalId, String userId, Map<String, dynamic> selectedAnswer) = _Submit;
}