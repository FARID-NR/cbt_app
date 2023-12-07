import 'package:cbt_app/data/datasource/endpoint/endpoint_remote_datasource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/response/endpoint_response_model.dart';

part 'endpoint_event.dart';
part 'endpoint_state.dart';
part 'endpoint_bloc.freezed.dart';

class EndpointBloc extends Bloc<EndpointEvent, EndpointState> {
  EndpointBloc() : super(const _Initial()) {
    on<_GetEndpoint>((event, emit) async {
      emit(const _Loading());
      final response = await EndpointRemoteDatasource().getEndpoint();
      response.fold(
        (l) => emit(_Error(l)), 
        (r) => emit(_Loaded(r))
      );
    });
  }
}
