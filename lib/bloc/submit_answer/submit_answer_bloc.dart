import 'package:bloc/bloc.dart';
import 'package:cbt_app/data/datasource/submit_answer/submit_remote_datasource.dart';
import 'package:cbt_app/data/models/request/submit_request_model.dart';
import 'package:cbt_app/data/models/response/submit_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasource/ujian/ujian_remote_datasource.dart';

part 'submit_answer_event.dart';
part 'submit_answer_state.dart';
part 'submit_answer_bloc.freezed.dart';

class SubmitAnswerBloc extends Bloc<SubmitAnswerEvent, SubmitAnswerState> {
  SubmitAnswerBloc() : super(const _Initial()) {
    on<_Submit>((event, emit) async {
      emit(const _Loading());
      final result = await SubmitRemoteDatasource().submit(event.requestModel, event.matkulId, event.soalId, event.userId, event.selectedAnswer);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r))
      );
    });
  }
}
