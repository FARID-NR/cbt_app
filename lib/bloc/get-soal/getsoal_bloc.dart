
import 'package:cbt_app/data/datasource/get-soal/getsoal_remote_datasource.dart';
import 'package:cbt_app/data/models/response/get_soal_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'getsoal_event.dart';
part 'getsoal_state.dart';
part 'getsoal_bloc.freezed.dart';

class GetsoalBloc extends Bloc<GetsoalEvent, GetsoalState> {
  GetsoalBloc() : super(const _Initial()) {
    on<_GetSoal>((event, emit) async{
      emit(const _Loading());
      final userId = event.userId;
      final response = await GetsoalRemoteDatasource().getSoal(userId);
      response.fold(
        (l) => emit(_Error(l)), 
        (r) => emit(_Loaded(r))
      );
    });
  }
}
