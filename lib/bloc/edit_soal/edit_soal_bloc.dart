import 'package:cbt_app/data/models/response/edit_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasource/edit-soal/edit_soal_remote_datasource.dart';
import '../../data/models/request/edit_request_model.dart';

part 'edit_soal_event.dart';
part 'edit_soal_state.dart';
part 'edit_soal_bloc.freezed.dart';

class EditSoalBloc extends Bloc<EditSoalEvent, EditSoalState> {
  EditSoalBloc() : super(const _Initial()) {
    on<_Edit>((event, emit) async {
      emit(const _Loading());
      final result = await EditSoalRemoteDatasource().editSoal(event.data, event.soalId);
      result.fold(
        (l) => emit(_Error(l)), 
        (r) => emit(_Loaded(r))
      );

    });
  }
}
