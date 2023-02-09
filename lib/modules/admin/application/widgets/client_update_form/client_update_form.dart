import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:unicons/unicons.dart';

import '../../../../../global/data/entities/entities.dart';
import '../../../../../global/domain/models/models.dart';
import 'client_update_form_bloc.dart';

class ClientUpdateForm extends StatelessWidget {
  final Client client;
  const ClientUpdateForm({required this.client, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClientUpdateFormBloc(client),
      child: Builder(builder: (context) {
        final clientFormBloc = context.read<ClientUpdateFormBloc>();
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.amber,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.min, children: [
            Text('Cliente #${client.id}'),
            FormBlocListener<ClientUpdateFormBloc, ClientUpdateParams, String>(
              onSuccess: (context, state) async {
                await AutoRouter.of(context).pop<ClientUpdateParams>(state.successResponse);
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
                DropdownFieldBlocBuilder(
                  selectFieldBloc: clientFormBloc.subscriptionPlan,
                  decoration: const InputDecoration(label: Text('Subscripción')),
                  itemBuilder: (context, value) => FieldItem(
                    child: Text(value.name),
                  ),
                ),
              ]),
            ),
            const Divider(),
            ElevatedButton.icon(
              icon: const Icon(UniconsLine.save),
              label: const Text('Actualizar'),
              onPressed: clientFormBloc.submit,
            )
          ]),
        );
      }),
    );
  }
}
