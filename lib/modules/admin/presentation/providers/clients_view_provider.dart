import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../global/domain/models/models.dart';

part 'clients_view_provider.freezed.dart';
part 'clients_view_provider.g.dart';

@riverpod
class ClientsViewProvider extends _$ClientsViewProvider {
  @override
  ClientsViewState build() => const ClientsViewState();
}

@freezed
class ClientsViewState with _$ClientsViewState {
  const factory ClientsViewState() = ClientsViewStateInitial;
  const factory ClientsViewState.loading() = ClientsViewStateLoading;
  const factory ClientsViewState.results(List<Client> clients) = ClientsViewStateResults;
  const factory ClientsViewState.error([String? error]) = ClientsViewStateError;

  factory ClientsViewState.fromJson(Map<String, dynamic> json) => _$ClientsViewStateFromJson(json);
}
