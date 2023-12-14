import 'package:bloc/bloc.dart';
import 'package:cbt_app/data/models/response/hasil_ujian_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasource/penilaian/penilaian_remote_datasource.dart';

part 'penilaian_event.dart';
part 'penilaian_state.dart';
part 'penilaian_bloc.freezed.dart';

class PenilaianBloc extends Bloc<PenilaianEvent, PenilaianState> {
  PenilaianBloc() : super(_Initial()) {
    on<_Penilaian>((event, emit) async {
      emit(const _Loading());
      final userId = event.userId;
      final response = await PenilaianRemoteDatasource().getHasilUjian(userId);
      response.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r)));
    });
  }
}
