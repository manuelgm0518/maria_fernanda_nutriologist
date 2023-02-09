part of 'clients_view_bloc.dart';

@freezed
class ClientsViewState with _$ClientsViewState {
  const factory ClientsViewState.initial() = _Initial;

  const factory ClientsViewState.loadInProgress() = _LoadInProgress;
  const factory ClientsViewState.loadFailure(String? failureMessage) = _LoadFailure;
  const factory ClientsViewState.loadSuccess(List<Client> clients) = _LoadSuccess;
}
