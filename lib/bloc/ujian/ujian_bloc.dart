// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:cbt_app/data/datasource/ujian/ujian_remote_datasource.dart';

import '../../data/models/response/ujian_response_model.dart';

part 'ujian_bloc.freezed.dart';
part 'ujian_event.dart';
part 'ujian_state.dart';

class UjianBloc extends Bloc<UjianEvent, UjianState> {
  final UjianRemoteDatasource ujianRemoteDatasource;
  UjianBloc(
    this.ujianRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetUjian>((event, emit) async {
      emit(const _Loading());
      final response = await ujianRemoteDatasource.getUjian(event.matkulId);
      response.fold(
        (l) => emit(_Error(l)), 
        (r) {
          if (r.data.soal.isEmpty) {
            emit(const _NotFound());
          } else {
            emit(_Loaded(r));
          }
        }
      );
    });
  }
}
