part of 'clients_view_bloc.dart';

@freezed
class ClientsViewEvent with _$ClientsViewEvent {
  const factory ClientsViewEvent.started() = _Started;

  const factory ClientsViewEvent.clientsFiltered(ClientsFilterParams params) = _ClientsFiltered;
  const factory ClientsViewEvent.clientAdded(ClientCreateParams params) = _ClientAdded;
  const factory ClientsViewEvent.clientUpdated(ClientUpdateParams params) = _ClientUpdated;
  const factory ClientsViewEvent.clientDeleted(String id) = _ClientDeleted;
}
