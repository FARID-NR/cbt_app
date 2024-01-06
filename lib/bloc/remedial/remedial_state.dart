part of 'remedial_bloc.dart';

@freezed
class RemedialState with _$RemedialState {
  const factory RemedialState.initial() = _Initial;
  const factory RemedialState.loading() = _Loading;
  const factory RemedialState.loaded(RemedialResponseModel  response) = _Loaded;
  const factory RemedialState.error(String message) = _Error;
}
