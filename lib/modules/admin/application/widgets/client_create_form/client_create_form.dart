import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:unicons/unicons.dart';

import '../../../../../global/data/entities/entities.dart';
import 'client_create_form_bloc.dart';

class ClientCreateForm extends StatelessWidget {
  const ClientCreateForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClientCreateFormBloc(),
      child: Builder(builder: (context) {
        final clientFormBloc = context.read<ClientCreateFormBloc>();
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.amber,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Nuevo Cliente'),
              FormBlocListener<ClientCreateFormBloc, ClientCreateParams, String>(
                onSuccess: (context, state) async {
                  await AutoRouter.of(context).pop<ClientCreateParams>(state.successResponse);
                },
                child: Column(children: [
                  TextFieldBlocBuilder(
                    textFieldBloc: clientFormBloc.firstName,
                    decoration: const InputDecoration(label: Text('Nombre')),
                  ),
                  TextFieldBlocBuilder(
                    textFieldBloc: clientFormBloc.lastName,
                    decoration: const InputDecoration(label: Text('Apellido/s')),
                  ),
                ]),
              ),
              const Divider(),
              ElevatedButton.icon(
                icon: const Icon(UniconsLine.user_plus),
                label: const Text('Registrar'),
                onPressed: clientFormBloc.submit,
              )
            ],
          ),
        );
      }),
    );
  }
}
