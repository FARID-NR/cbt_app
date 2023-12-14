import 'package:bloc/bloc.dart';
import 'package:cbt_app/data/datasource/pengajuan/pengajuan_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/response/get_pengajuan_response_model.dart';

part 'pengajuan_event.dart';
part 'pengajuan_state.dart';
part 'pengajuan_bloc.freezed.dart';

class PengajuanBloc extends Bloc<PengajuanEvent, PengajuanState> {
  PengajuanBloc() : super(const _Initial()) {
    on<_Pengajuan>((event, emit) async {
      emit(const _Loading());
      final userId = event.userId;
      final response = await PengajuanRemoteDatasource().getPengujian(userId);
      response.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r)));
    });

    // on<_Pengajuan>((event, emit) async {
    //   emit(const _Loading());
    //   final userId = event.userId;
    //   final response = await PengajuanRemoteDatasource().getStatusUjian(userId);
    //   response.fold(
    //     (l) => emit(_Error(l)),
    //     (r) => emit(_Loaded())
    //   );
    // });
  }
}
