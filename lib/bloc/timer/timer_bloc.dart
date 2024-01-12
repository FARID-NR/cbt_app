import 'package:cbt_app/data/models/request/timer_request_model.dart';
import 'package:cbt_app/data/models/response/timer_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasource/timer/timer_remote_datasource.dart';

part 'timer_event.dart';
part 'timer_state.dart';
part 'timer_bloc.freezed.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(const _Initial()) {
    on<_Timer>((event, emit) async {
      emit(const _Loading());
      final result = await TimerRemoteDatasource().addTimer(event.data, event.soalId);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r))
      );
    });

    on<_Delete>((event, emit) async {
      emit(const _Loading());
      final result = await TimerRemoteDatasource().deleteTimer(event.dataId);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r))
      );
    });
  }
}
