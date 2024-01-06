import 'package:bloc/bloc.dart';
import 'package:cbt_app/data/models/request/register_request_model.dart';
import 'package:cbt_app/data/models/response/register_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasource/register/register_remote_datasource.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const _Initial()) {
    on<_Register>((event, emit) async {
      emit(const _Loading());
      final response = await RegisterRemoteDataSource().register(event.data);
      response.fold((l) => emit(_Error(l)), (r) => emit(_Success(r)));
    });
  }
}
