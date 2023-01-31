import 'package:flutter/material.dart';

import '../../../../../global/domain/models/models.dart';
import 'client_tile.dart';

class ClientsList extends StatelessWidget {
  final List<Client> clients;
  const ClientsList(this.clients, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: clients.length,
      itemBuilder: (context, index) {
        final client = clients[index];
        return ClientTile(client);
      },
    );
  }
}
