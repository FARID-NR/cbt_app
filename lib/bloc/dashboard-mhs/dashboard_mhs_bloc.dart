import 'package:cbt_app/data/models/response/dashboard_mhs_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasource/dashboard_mhs/dashboard_mhs_remote_datasource.dart';

part 'dashboard_mhs_event.dart';
part 'dashboard_mhs_state.dart';
part 'dashboard_mhs_bloc.freezed.dart';

class DashboardMhsBloc extends Bloc<DashboardMhsEvent, DashboardMhsState> {
  DashboardMhsBloc() : super(const _Initial()) {
    on<_GetDashMhs>((event, emit) async {
      emit(const _Loading());
      final response = await DashboardMhsRemoteDatasource().getDashMhs();
      response.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r)));
    });
  }
}
