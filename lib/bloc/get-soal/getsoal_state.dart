part of 'getsoal_bloc.dart';

@freezed
class GetsoalState with _$GetsoalState {
  const factory GetsoalState.initial() = _Initial;
  const factory GetsoalState.loading() = _Loading;
  const factory GetsoalState.loaded(GetSoalResponseModel data) = _Loaded;
  const factory GetsoalState.error(String message) = _Error;
}
