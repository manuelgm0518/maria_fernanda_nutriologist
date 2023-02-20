import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../global/application/widgets/widgets.dart';
import '../../../../../global/domain/repositories/repositories.dart';
import '../../../../../global/domain/usecases/usecases.dart';
import '../../widgets/widgets.dart';
import 'bloc/clients_page_bloc.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final clientsRepository = RepositoryProvider.of<ClientsRepository>(context);
        return ClientsPageBloc(clientsWatchUseCase: ClientsWatchUseCase(clientsRepository));
      },
      child: BlocBuilder<ClientsPageBloc, ClientsPageState>(builder: (context, state) {
        final clientsPageBloc = context.read<ClientsPageBloc>();
        return state.when(
          loadInProgress: () => const Center(child: CircularProgressIndicator()),
          loadFailure: (message) => StatusView.failure(
            message: message!,
            onConfirmed: () => clientsPageBloc.add(const ClientsPageEvent.failureConfirmed()),
          ),
          loadSuccess: (clients) => ClientsList(clients: clients),
        );
      }),
    );
  }
}
