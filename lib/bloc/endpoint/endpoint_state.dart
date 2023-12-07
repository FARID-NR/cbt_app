part of 'endpoint_bloc.dart';

@freezed
class EndpointState with _$EndpointState {
  const factory EndpointState.initial() = _Initial;
  const factory EndpointState.loading() = _Loading;
  const factory EndpointState.loaded(EndpointResponseModel data) = _Loaded;
  const factory EndpointState.error(String message) = _Error;
}
