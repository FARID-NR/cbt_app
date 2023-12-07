part of 'endpoint_bloc.dart';

@freezed
class EndpointEvent with _$EndpointEvent {
  const factory EndpointEvent.started() = _Started;
  const factory EndpointEvent.getEndpoint() = _GetEndpoint;
}