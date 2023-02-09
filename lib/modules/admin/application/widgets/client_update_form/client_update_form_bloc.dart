import 'dart:async';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../../../global/data/entities/entities.dart';
import '../../../../../global/domain/models/models.dart';

class ClientUpdateFormBloc extends FormBloc<ClientUpdateParams, String> {
  final Client client;
  final firstName = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final lastName = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final subscriptionPlan = SelectFieldBloc(items: SubscriptionPlan.values);

  ClientUpdateFormBloc(this.client) {
    firstName.changeValue(client.firstName);
    lastName.changeValue(client.lastName);
    subscriptionPlan.changeValue(client.subscriptionPlan);
    addFieldBlocs(
      fieldBlocs: [
        firstName,
        lastName,
        subscriptionPlan,
      ],
    );
  }

  @override
  FutureOr<void> onSubmitting() {
    emitSuccess(
      successResponse: ClientUpdateParams(
        client.id,
        firstName: firstName.value,
        lastName: lastName.value,
        subscriptionPlan: subscriptionPlan.value,
      ),
    );
  }
}
