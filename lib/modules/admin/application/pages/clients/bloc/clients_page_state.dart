part of 'clients_page_bloc.dart';

@freezed
class ClientsPageState with _$ClientsPageState {
  const factory ClientsPageState.loadInProgress() = _LoadInProgress;
  const factory ClientsPageState.loadFailure(String? failureMessage) = _LoadFailure;
  const factory ClientsPageState.loadSuccess(List<Client> clients) = _LoadSuccess;
}
