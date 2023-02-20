import 'dart:async';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../../../global/data/entities/entities.dart';
import '../../../../../global/domain/models/models.dart';
import '../../../../../global/domain/usecases/usecases.dart';

class ClientFormBloc extends FormBloc<ClientFormResponse, String> {
  Client? client;
  final ClientCreateUseCase clientCreateUseCase;
  final ClientUpdateUseCase clientUpdateUseCase;
  final ClientDeleteUseCase clientDeleteUseCase;

  final firstName = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final lastName = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final subscriptionPlan = SelectFieldBloc(items: SubscriptionPlan.values);

  bool get isNewClient => client == null;

  ClientFormBloc({
    this.client,
    required this.clientCreateUseCase,
    required this.clientUpdateUseCase,
    required this.clientDeleteUseCase,
  }) {
    if (client != null) {
      firstName.changeValue(client!.firstName);
      lastName.changeValue(client!.lastName);
      subscriptionPlan.changeValue(client!.subscriptionPlan);
    }
    addFieldBlocs(
      fieldBlocs: [
        firstName,
        lastName,
        if (client != null) subscriptionPlan,
      ],
    );
  }

  @override
  FutureOr<void> onSubmitting() {
    isNewClient ? _createClient() : _updateClient();
  }

  @override
  FutureOr<void> onDeleting() {
    _deleteClient();
  }

  void _createClient() async {
    emitLoading();
    final res = await clientCreateUseCase.call(ClientCreateParams(
      firstName: firstName.value,
      lastName: lastName.value,
    ));
    res.fold((l) => emitFailure(failureResponse: l.message), (r) {
      emitSuccess(
        successResponse: ClientFormResponse(
          type: ClientFormResponseType.created,
          message: 'The client ${r.fullName} was created successfully',
          client: r,
        ),
      );
    });
  }

  void _updateClient() async {
    emitLoading();
    final res = await clientUpdateUseCase.call(ClientUpdateParams(
      client!.id,
      firstName: firstName.value,
      lastName: lastName.value,
      subscriptionPlan: subscriptionPlan.value,
    ));
    res.fold((l) => emitFailure(failureResponse: l.message), (r) {
      emitSuccess(
        successResponse: ClientFormResponse(
          type: ClientFormResponseType.updated,
          message: 'The client ${r.fullName} was updated successfully',
          client: r,
        ),
      );
    });
  }

  void _deleteClient() async {
    emitLoading();
    final res = await clientDeleteUseCase.call(client!.id);
    res.fold((l) => emitFailure(failureResponse: l.message), (r) {
      clear();
      emitSuccess(
        successResponse: ClientFormResponse(
          type: ClientFormResponseType.deleted,
          message: 'The client ${r.fullName} was deleted successfully',
          client: r,
        ),
      );
    });
  }
}

enum ClientFormResponseType { updated, deleted, created }

class ClientFormResponse {
  final ClientFormResponseType type;
  final Client client;
  final String message;
  const ClientFormResponse({required this.type, required this.message, required this.client});
}
