import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';

import '../../../../core/app_router.gr.dart';
import '../../../../global/data/entities/entities.dart';
import '../../../../global/domain/repositories/repositories.dart';
import '../../../../global/domain/usecases/usecases.dart';
import '../bloc/clients_view/clients_view_bloc.dart';
import '../widgets/widgets.dart';

class ClientsView extends StatelessWidget {
  const ClientsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final clientsRepository = RepositoryProvider.of<ClientsRepository>(context);
        return ClientsViewBloc(
          clientsFilterUseCase: ClientsFilterUseCase(clientsRepository),
          clientCreateUseCase: ClientCreateUseCase(clientsRepository),
          clientUpdateUseCase: ClientUpdateUseCase(clientsRepository),
          clientDeleteUseCase: ClientDeleteUseCase(clientsRepository),
        );
      },
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Text('Lista de clientes'),
        Expanded(
          child: BlocBuilder<ClientsViewBloc, ClientsViewState>(builder: (context, state) {
            final clientsViewBloc = context.read<ClientsViewBloc>();
            return state.when(
              initial: () => Center(
                child: ElevatedButton.icon(
                  icon: const Icon(UniconsLine.refresh),
                  label: const Text('Cargar clientes'),
                  onPressed: () => clientsViewBloc.add(ClientsViewEvent.clientsFiltered(ClientsFilterParams())),
                ),
              ),
              loadInProgress: () => const Center(child: CircularProgressIndicator()),
              loadFailure: (message) => Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Error: $message'),
                ElevatedButton.icon(
                  icon: const Icon(UniconsLine.refresh),
                  label: const Text('Cargar clientes'),
                  onPressed: () => clientsViewBloc.add(ClientsViewEvent.clientsFiltered(ClientsFilterParams())),
                ),
              ]),
              loadSuccess: (clients) => Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton.icon(
                  icon: const Icon(UniconsLine.refresh),
                  label: const Text('Cargar clientes'),
                  onPressed: () => clientsViewBloc.add(ClientsViewEvent.clientsFiltered(ClientsFilterParams())),
                ),
                Expanded(
                  child: ClientsList(
                    clients,
                    onClientTap: (client) async {
                      final params = await AutoRouter.of(context).pushWidget<ClientUpdateParams>(Scaffold(body: ClientUpdateForm(client: client)));
                      if (params != null) {
                        clientsViewBloc.add(ClientsViewEvent.clientUpdated(params));
                      }
                    },
                  ),
                ),
                ElevatedButton(
                  child: const Text('Registrar cliente'),
                  onPressed: () async {
                    final params = await AutoRouter.of(context).pushWidget<ClientCreateParams>(Scaffold(body: Center(child: ClientCreateForm())));

                    if (params != null) {
                      clientsViewBloc.add(ClientsViewEvent.clientAdded(params));
                    }
                  },
                )
              ]),
            );
          }),
        ),
      ]),
    );
  }
}
