part of 'dashboard_mhs_bloc.dart';

@freezed
class DashboardMhsEvent with _$DashboardMhsEvent {
  const factory DashboardMhsEvent.started() = _Started;
  const factory DashboardMhsEvent.getDashMhs() = _GetDashMhs;
}