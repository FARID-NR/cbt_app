import 'package:bloc/bloc.dart';
import 'package:cbt_app/data/datasource/dashboard/dashboard_remote_datasource.dart';
import 'package:cbt_app/data/models/response/dashboard_response_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';
part 'dashboard_bloc.freezed.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const _Initial()) {
    // debugPrint();
    on<_GetDash>((event, emit) async {
      emit(const _Loading());
      final response = await DashboardRemoteDatasource().getDash();
      response.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r)));
    });
  }
}
