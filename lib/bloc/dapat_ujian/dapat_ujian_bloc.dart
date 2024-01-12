import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasource/dapat-ujian/dapat_ujian_remote_datasource.dart';
import '../../data/models/response/dapat_ujian_response_model.dart';

part 'dapat_ujian_event.dart';
part 'dapat_ujian_state.dart';
part 'dapat_ujian_bloc.freezed.dart';

class DapatUjianBloc extends Bloc<DapatUjianEvent, DapatUjianState> {
  DapatUjianBloc() : super(const _Initial()) {
    on<_DapatUjian>((event, emit) async {
      emit(const _Loading());
      final response = await DapatUjianRemoteDatasource().dapatUjian(event.matkulId, event.mhsId);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r))
      );
    });
  }
}
