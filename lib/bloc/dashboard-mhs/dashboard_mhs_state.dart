part of 'dashboard_mhs_bloc.dart';

@freezed
class DashboardMhsState with _$DashboardMhsState {
  const factory DashboardMhsState.initial() = _Initial;
  const factory DashboardMhsState.loading() = _Loading;
  const factory DashboardMhsState.loaded(DashboardMhsResponseModel data) = _Loaded;
  const factory DashboardMhsState.error(String message) = _Error;
}
