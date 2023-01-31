import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../global/domain/models/models.dart';

class ClientTile extends StatelessWidget {
  final Client client;

  const ClientTile(this.client, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(client.fullName),
      subtitle: Text(DateFormat('dd-MM-yyyy').format(client.model.createdAt)),
      trailing: Text(client.subscriptionPlan.name),
    );
  }
}