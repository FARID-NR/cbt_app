import 'dart:convert';

import 'package:cbt_app/data/datasource/download_sk/download_sk_remote_datasource.dart';
import 'package:cbt_app/data/models/request/download_sk_request_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_sk_event.dart';
part 'download_sk_state.dart';
part 'download_sk_bloc.freezed.dart';

class DownloadSkBloc extends Bloc<DownloadSkEvent, DownloadSkState> {
  DownloadSkBloc() : super(const _Initial()) {
    on<_DownloadSk>((event, emit) async {
      emit(const DownloadSkState.loading());
      final result = await DownloadSkRemoteDatasource().downloadSk(event.downloadSK, event.nmMatkul);
      result.fold(
        (l) => emit(DownloadSkState.error(l)),
        (r) {
          final Uint8List data = Uint8List.fromList(utf8.encode(r));
          emit(DownloadSkState.loaded(data));
        }
      );
    });
  }
}
