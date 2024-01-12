import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasource/remedial/remedial_remote_datasource.dart';
import '../../data/models/response/remedial_response_model.dart';

part 'remedial_event.dart';
part 'remedial_state.dart';
part 'remedial_bloc.freezed.dart';

class RemedialBloc extends Bloc<RemedialEvent, RemedialState> {
  RemedialBloc() : super(const _Initial()) {
    on<_Remedial>((event, emit) async {
      emit(const _Loading());
      final result = await RemedialRemoteDatasource().remedial(event.matkulId, event.mhsId);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r))
      );
    });
  }
}
