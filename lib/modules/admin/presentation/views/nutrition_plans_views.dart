import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NutritionPlansView extends HookConsumerWidget {
  const NutritionPlansView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchField = useTextEditingController();

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const Text('Planes de nutrición'),
      TextField(controller: searchField),
      Expanded(
        child: Text(searchField.text),
      ),
    ]);
  }
}
