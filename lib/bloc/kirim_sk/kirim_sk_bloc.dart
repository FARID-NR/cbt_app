import 'dart:convert';

import 'package:cbt_app/data/models/request/kirim_sk_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasource/kirim_sk_remote_datasource.dart/kirim_sk_remote_datasource.dart';

part 'kirim_sk_event.dart';
part 'kirim_sk_state.dart';
part 'kirim_sk_bloc.freezed.dart';

class KirimSkBloc extends Bloc<KirimSkEvent, KirimSkState> {
  KirimSkBloc() : super(const _Initial()) {
    on<_KirimSk>((event, emit) async {
      emit(const _Loading());
      final result = await KirimSkRemoteDatasource().kirimSK(event.context, event.kirimSk, event.nmMatkul);
      result.fold(
        (l) => emit(_Error(l)),
        (r) {
          final Uint8List data = Uint8List.fromList(utf8.encode(r));
          emit(KirimSkState.loaded(data));
          // await KirimSkRemoteDatasource().showDownloadNotification();
        }
      );
    });
  }
}
