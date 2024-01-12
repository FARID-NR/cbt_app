import 'package:cbt_app/data/models/response/batal_kirim_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasource/batal_kirim/batal_kirim_remote_datasource.dart';

part 'batal_kirim_event.dart';
part 'batal_kirim_state.dart';
part 'batal_kirim_bloc.freezed.dart';

class BatalKirimBloc extends Bloc<BatalKirimEvent, BatalKirimState> {
  BatalKirimBloc() : super(const _Initial()) {
    on<_BatalKirim>((event, emit) async {
      emit(const _Loading());
      final result = await BatalKirimRemoteDatasource().batalKirim(event.matkulId, event.mhsId);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r))
      );
    });
  }
}
