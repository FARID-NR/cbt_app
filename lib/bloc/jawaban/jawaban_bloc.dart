import 'package:cbt_app/data/models/request/jawaban_request_model.dart';
import 'package:cbt_app/data/models/response/jawaban_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasource/jawaban/jawaban_remote_datasource.dart';

part 'jawaban_event.dart';
part 'jawaban_state.dart';
part 'jawaban_bloc.freezed.dart';

class JawabanBloc extends Bloc<JawabanEvent, JawabanState> {
  JawabanBloc() : super(const _Initial()) {
    on<_Jawaban>((event, emit) async {
      emit(const _Loading());
      final soalId = event.soalId;
      final result = await JawabanRemoteDatasource().jawaban(event.data, soalId);
      result.fold(
        (l) => emit(_Error(l)), 
        (r) => emit(_Loaded(r))
      );
      
    });
  }
}
