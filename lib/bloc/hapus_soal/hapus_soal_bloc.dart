
import 'package:cbt_app/data/datasource/hapus_soal/hapus_soal_remote_datasource.dart';
import 'package:cbt_app/data/models/response/hapus_soal_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hapus_soal_event.dart';
part 'hapus_soal_state.dart';
part 'hapus_soal_bloc.freezed.dart';

class HapusSoalBloc extends Bloc<HapusSoalEvent, HapusSoalState> {
  HapusSoalBloc() : super(const _Initial()) {
    on<_Hapus>((event, emit) async {
      emit(const _Loading());
      final result = await HapusSoalRemoteDatasource().hapusSoal(event.userId);
      result.fold(
        (l) => emit(_Error(l)), 
        (r) => emit(_Loaded(r))
      );
    });
  }
}
