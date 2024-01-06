part of 'remedial_bloc.dart';

@freezed
class RemedialEvent with _$RemedialEvent {
  const factory RemedialEvent.started() = _Started;
  const factory RemedialEvent.remedial({required int matkulId, required int mhsId}) = _Remedial;
}