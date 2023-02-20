part of 'clients_page_bloc.dart';

@freezed
class ClientsPageEvent with _$ClientsPageEvent {
  const factory ClientsPageEvent.clientsListed(ClientsFilterParams? params) = _ClientsListed;
  const factory ClientsPageEvent.failureConfirmed() = _FailureConfirmed;

  const factory ClientsPageEvent.clientsWatched(ClientsFilterParams? params) = _ClientsWatched;

  // const factory ClientsPageEvent.clientAdded(ClientCreateParams params) = _ClientAdded;
  // const factory ClientsPageEvent.clientUpdated(ClientUpdateParams params) = _ClientUpdated;
  // const factory ClientsPageEvent.clientDeleted(String id) = _ClientDeleted;
}
