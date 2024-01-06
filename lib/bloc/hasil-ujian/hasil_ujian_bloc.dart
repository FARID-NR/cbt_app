import 'package:bloc/bloc.dart';
import 'package:cbt_app/data/datasource/hasil_ujian/hasil_remote_datasource.dart';
import 'package:cbt_app/data/models/response/hasil_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hasil_ujian_event.dart';
part 'hasil_ujian_state.dart';
part 'hasil_ujian_bloc.freezed.dart';

class HasilUjianBloc extends Bloc<HasilUjianEvent, HasilUjianState> {
  HasilUjianBloc() : super(const _Initial()) {
    on<_Hasil>((event, emit) async {
      emit(const _Loading());
      final response = await HasilUjianRemoteDatasource().getHasil(event.matkulId);
      emit(response.fold((l) => _Error(l), (r) => _Loaded(r)));
    });
  }
}
