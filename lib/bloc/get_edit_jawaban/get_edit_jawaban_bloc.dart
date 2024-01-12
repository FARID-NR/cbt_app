
import 'package:cbt_app/data/datasource/edit_jawaban/edit_jawaban_remote_datasource.dart';
import 'package:cbt_app/data/models/response/edit_jawaban_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_edit_jawaban_event.dart';
part 'get_edit_jawaban_state.dart';
part 'get_edit_jawaban_bloc.freezed.dart';

class GetEditJawabanBloc extends Bloc<GetEditJawabanEvent, GetEditJawabanState> {
  GetEditJawabanBloc() : super(const _Initial()) {
    on<_GetJawaban>((event, emit) async {
      emit(const GetEditJawabanState.loading());
      final result = await EditJawabanRemoteDatasource().getSoal(event.soalId);
      result.fold(
        (l) => emit(GetEditJawabanState.error(l)),
        (r) => emit(GetEditJawabanState.loaded(r))
      );
    });
  }
}
