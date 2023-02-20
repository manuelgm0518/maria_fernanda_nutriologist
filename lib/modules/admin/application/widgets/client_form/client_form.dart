import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:unicons/unicons.dart';

import '../../../../../global/application/widgets/widgets.dart';
import '../../../../../global/domain/models/models.dart';
import '../../../../../global/domain/repositories/repositories.dart';
import '../../../../../global/domain/usecases/usecases.dart';
import 'client_form_bloc.dart';

class ClientForm extends StatelessWidget {
  final Client? client;
  const ClientForm({this.client, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final clientsRepository = RepositoryProvider.of<ClientsRepository>(context);
        return ClientFormBloc(
          client: client,
          clientCreateUseCase: ClientCreateUseCase(clientsRepository),
          clientUpdateUseCase: ClientUpdateUseCase(clientsRepository),
          clientDeleteUseCase: ClientDeleteUseCase(clientsRepository),
        );
      },
      child: Scaffold(
        body: FormBlocListener<ClientFormBloc, ClientFormResponse, String>(
          child: BlocBuilder<ClientFormBloc, FormBlocState>(builder: (context, state) {
            final clientFormBloc = context.read<ClientFormBloc>();
            if (state is FormBlocLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FormBlocFailure) {
              return StatusView.failure(
                message: state.failureResponse!,
                onConfirmed: () => AutoRouter.of(context).pop<String>(state.failureResponse),
              );
            } else if (state is FormBlocSuccess) {
              return StatusView.success(
                message: (state.successResponse as ClientFormResponse).message,
                onConfirmed: () => AutoRouter.of(context).pop<ClientFormResponse>(state.successResponse),
              );
            }
            return _ClientForm(bloc: clientFormBloc);
          }),
        ),
      ),
    );
  }
}

class _ClientForm extends StatelessWidget {
  final ClientFormBloc bloc;
  const _ClientForm({required this.bloc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.min, children: [
      Text(bloc.isNewClient ? 'New Client' : 'Client #${bloc.client!.id}'),
      TextFieldBlocBuilder(
        textFieldBloc: bloc.firstName,
        decoration: const InputDecoration(label: Text('Name')),
      ),
      TextFieldBlocBuilder(
        textFieldBloc: bloc.lastName,
        decoration: const InputDecoration(label: Text('Last name(s)')),
      ),
      DropdownFieldBlocBuilder(
        selectFieldBloc: bloc.subscriptionPlan,
        decoration: const InputDecoration(label: Text('Subscription')),
        itemBuilder: (context, value) => FieldItem(
          child: Text(value.name),
        ),
      ),
      const Divider(),
      ElevatedButton.icon(
        icon: Icon(bloc.isNewClient ? UniconsLine.user_plus : UniconsLine.save),
        label: Text(bloc.isNewClient ? 'Register' : 'Update'),
        onPressed: () => bloc.submit(),
      ),
      if (!bloc.isNewClient)
        ElevatedButton.icon(
          icon: const Icon(UniconsLine.trash_alt),
          label: const Text('Delete'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () => bloc.delete(),
        ),
    ]);
  }
}
