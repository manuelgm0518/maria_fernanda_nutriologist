import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ClientsView extends HookConsumerWidget {
  const ClientsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchField = useTextEditingController();
    final text = useState(searchField.text);

    useEffect(() {
      searchField.addListener(() => text.value = searchField.text);
      return null;
    }, [searchField]);

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const Text('Lista de clientes'),
      TextField(controller: searchField),
      Text(text.value),
    ]);
  }
}
