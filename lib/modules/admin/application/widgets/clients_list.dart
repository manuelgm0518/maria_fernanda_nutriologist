import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../global/application/widgets/widgets.dart';
import '../../../../global/domain/models/models.dart';
import 'client_form/client_form.dart';

class ClientsList extends StatelessWidget {
  final List<Client> clients;
  const ClientsList({required this.clients, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return clients.isEmpty
        ? StatusView.empty(
            message: 'Not registered clients found',
            confirmText: 'Register client',
            onConfirmed: () => AutoRouter.of(context).pushWidget(const ClientForm()),
          )
        // : StreamBuilder(builder: (context, snapshot) {

        // });
        : ListView.builder(
            itemCount: clients.length,
            itemBuilder: (context, index) {
              final client = clients[index];
              return _ClientTile(
                client: client,
                onTap: () => AutoRouter.of(context).pushWidget(ClientForm(client: client)),
              );
            },
          );
  }
}

class _ClientTile extends StatelessWidget {
  final Client client;
  final void Function() onTap;
  const _ClientTile({required this.client, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(client.fullName),
      subtitle: Text(DateFormat('dd-MM-yyyy').format(client.createdAt)),
      trailing: Text(client.subscriptionPlan.name),
      onTap: onTap,
    );
  }
}
