import 'package:bloc/bloc.dart';
import 'package:cbt_app/data/datasource/ujian/ujian_remote_datasource.dart';
import 'package:cbt_app/data/models/response/ujian_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dafttar_soal_event.dart';
part 'dafttar_soal_state.dart';
part 'dafttar_soal_bloc.freezed.dart';

class DaftarSoalBloc extends Bloc<DaftarSoalEvent, DaftarSoalState> {
  DaftarSoalBloc() : super(const _Initial()) {
    on<_DaftarSoal>((event, emit) {
      emit(const DaftarSoalState.loading());
      emit(DaftarSoalState.loaded(event.data, 0, event.data.length > 1, false));
    });

    on<_NextSoal>((event, emit) {
      final currentState = state as _Loaded;
      final newIndex = currentState.index + 1;

      emit(DaftarSoalState.loaded(
        currentState.data,
        newIndex,
        newIndex < currentState.data.length - 1, // Periksa apakah ada soal berikutnya setelah newIndex
        newIndex > 0, // Menandakan bahwa ada soal sebelumnya
      ));
    });

    on<_BackSoal>((event, emit) {
      final currentState = state as _Loaded;
      final newIndex = currentState.index - 1;

      emit(DaftarSoalState.loaded(
        currentState.data,
        newIndex,
        newIndex < currentState.data.length - 1, // Periksa apakah ada soal setelah newIndex
        newIndex > 0, // Menandakan bahwa ada soal sebelumnya
      ));
    });

    // on<_SetAnswer>((event, emit) async {
    //   emit(const DaftarSoalState.loading());
    //   final response = await UjianRemoteDatasource.answer();
    //   // emit(DaftarSoalState.success(event.soalId, event.jawaban));
    // });
  }
}
