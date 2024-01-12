import 'package:cbt_app/data/datasource/add_soal/add_soal_remote_datasource.dart';
import 'package:cbt_app/data/models/request/add_soal_request_model.dart';
import 'package:cbt_app/data/models/response/add_soal_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_soal_event.dart';
part 'add_soal_state.dart';
part 'add_soal_bloc.freezed.dart';

class AddSoalBloc extends Bloc<AddSoalEvent, AddSoalState> {
  AddSoalBloc() : super(const _Initial()) {
    on<_AddSoal>((event, emit) async {
      emit(const _Loading());
      final result = await AddSoalRemoteDatasource().addSoal(event.data);
      result.fold(
        (l) => emit(_Error(l)), 
        (r) => emit(_Loaded(r))
      );
    });

    on<_Hapus>((event, emit) async {
      emit(const _Loading());
      final userId = event.userId;
      final response = await AddSoalRemoteDatasource().hapusSoal(userId);
      response.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r)));
    });
  }
}
