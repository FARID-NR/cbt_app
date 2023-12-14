import 'package:bloc/bloc.dart';
import 'package:cbt_app/data/models/response/lihat_nilai_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasource/lihat-nilai/lihat_nilai_remote_datasource.dart';

part 'lihat_nilai_event.dart';
part 'lihat_nilai_state.dart';
part 'lihat_nilai_bloc.freezed.dart';

class LihatNilaiBloc extends Bloc<LihatNilaiEvent, LihatNilaiState> {
  LihatNilaiBloc() : super(const _Initial()) {
    on<_Lihat>((event, emit) async {
      emit(const _Loading());
      final idMatkul = event.idMatkul;
      final idMhs = event.idMhs;
      final response = await LihatNilaiRemoteDatasource().getSoal(idMatkul, idMhs);
      emit(response.fold((l) => _Error(l), (r) => _Loaded(r)));
    });
  }
}
