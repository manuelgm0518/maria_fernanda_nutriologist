import 'dart:async';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../../../global/data/entities/entities.dart';

class ClientCreateFormBloc extends FormBloc<ClientCreateParams, String> {
  final firstName = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final lastName = TextFieldBloc(validators: [FieldBlocValidators.required]);

  ClientCreateFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        firstName,
        lastName,
      ],
    );
  }

  @override
  FutureOr<void> onSubmitting() {
    emitSuccess(
      successResponse: ClientCreateParams(
        firstName: firstName.value,
        lastName: lastName.value,
      ),
    );
  }
}
